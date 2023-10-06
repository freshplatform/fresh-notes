import 'dart:async';
import 'dart:convert' show jsonEncode;

import '../../../core/data/crud_exceptions.dart';
import '../../../core/log/logger.dart';
import '../../../logic/utils/list.dart';
import '../../../logic/utils/others/differnce_result.dart';
import '../../../logic/utils/others/packages/quill.dart';
import '../../../models/note/m_note.dart';
import '../../auth/auth_service.dart';
import '../../cloud/note/s_cloud_notes.dart';
import '../../cloud/shared/sync_options.dart';
import '../../database/notes/s_local_notes.dart';
import 'models/m_note_input.dart';

class NotesDataService {
  factory NotesDataService.getInstance() => _instance;
  NotesDataService._();

  static final _instance = NotesDataService._();

  final List<Note> _notes = [];
  final StreamController<List<Note>> _notesStreamController =
      StreamController<List<Note>>.broadcast(
    onListen: () {
      AppLogger.log(
        'onListen: A new user is now listenting for the notes stream controller.',
      );
    },
    onCancel: () {
      AppLogger.log(
        'onCancel: The user has cancel the listenting for the notes stream controller.',
      );
    },
  );

  StreamController<List<Note>> get notesStreamController =>
      _notesStreamController;
  final _localNotesService = LocalNotesService.getInstance();
  final _cloudNotesService = CloudNotesService.getInstance();

  Future<void> startAndFetchAllNotes() async {
    try {
      _notes.clear();
      await initialize();
      await getAll();
    } catch (e, stacktrace) {
      _notesStreamController.addError(e, stacktrace);
    }
  }

  Future<void> initialize() async {
    await _localNotesService.initialize();
  }

  bool get isInitialized => _localNotesService.isInitialized;

  // @override
  Future<void> deInitialize() async {
    await _localNotesService.deInitialize();
  }

  Future<void> createOne(CreateNoteInput createInput) async {
    final syncOptions = createInput.syncOptions;
    String? cloudId;
    if (syncOptions.isSyncWithCloud) {
      final cloudNote = await _cloudNotesService.createOne(createInput);
      cloudId = cloudNote.id;
    }
    final note = Note.fromLocalNote(
      await _localNotesService.createOne(
        createInput.copyWith(
          syncOptions: SyncOptions.getSyncOptions(
            isSyncWithCloud: syncOptions.isSyncWithCloud,
            existingCloudNoteId: cloudId,
          ),
        ),
      ),
    );
    _notes.insert(0, note);
    _notesStreamController.add(_notes);
  }

  Future<void> insertOrReplaceOne(
    QuillDocument document, {
    required SyncOptions syncOptions,
    required bool isPrivate,
    String? currentId,
  }) async {
    AppLogger.log('Sync option = ${syncOptions.toString()}');
    final isEditing = currentId != null;
    final user = AuthService.getInstance().requireCurrentUser(
      'In order to create or update note, the user must be authenticated.',
    );

    final cachedImages =
        await QuillUtilities.getCachedImagePathsFromDocumentAndMakeSureItExists(
            document);
    AppLogger.log(
      'Local images: ${QuillUtilities.getLocalImagesPathsFromDocument(document).toString()}',
    );
    final newImages = await QuillUtilities.saveCachedImagesToDocumentDirectory(
      cachedImages: cachedImages,
    );

    // Then we want to replace all the cached images with the saved ones
    var documentInJson = jsonEncode(document.toDelta().toJson());
    AppLogger.log(
      'The document data before replace the cached images with saved one: $documentInJson',
    );
    cachedImages.toList().asMap().forEach((index, cachedImage) {
      final savedImage = newImages[index];
      documentInJson = documentInJson.replaceAll(cachedImage, savedImage);
    });
    AppLogger.log(
      'The document data after replacing the cached images with saved one: $documentInJson',
    );
    if (isEditing) {
      await updateOne(
        UpdateNoteInput(
          text: documentInJson,
          syncOptions: syncOptions,
          isPrivate: isPrivate,
        ),
        currentId,
      );
      return;
    }
    await createOne(
      CreateNoteInput(
        text: documentInJson,
        userId: user.id,
        syncOptions: syncOptions,
        isPrivate: isPrivate,
      ),
    );
  }

  Future<void> deleteAll() async {
    await _localNotesService.deleteAll();
    for (final note in _notes) {
      await QuillUtilities.deleteAllImagesOfNote(note.text);
    }
    _notes.clear();
    _notesStreamController.add(_notes);
    await _cloudNotesService.deleteAll();
  }

  Future<void> deleteByIds(List<String> ids) async {
    await _localNotesService.deleteByIds(ids);
    _notes.removeWhere((note) => ids.contains(note.id));
    _notesStreamController.add(_notes);
    await _cloudNotesService.deleteByIds(ids);
  }

  Future<void> deleteOneById(String id) async {
    await _localNotesService.deleteOneById(id);

    final noteIndex = _notes.indexWhere((note) => note.id == id);
    if (noteIndex != -1) {
      final note = _notes[noteIndex];
      await QuillUtilities.deleteAllImagesOfNote(_notes[noteIndex].text);
      _notes.removeAt(noteIndex);
      _notesStreamController.add(_notes);

      final cloudNoteId = note.syncOptions.getCloudNoteId();
      if (cloudNoteId != null) {
        await _cloudNotesService.deleteOneById(cloudNoteId);
      }
      return;
    }
    throw CrudOperationFaieldException(
      "We couldn't find the index for the currentId of the deleting note in NoteDataService, the id is $id",
    );
  }

  Future<void> getAll({int limit = -1, int page = 1}) async {
    final localNotes = (await _localNotesService.getAll(
      limit: limit,
      page: page,
    ))
        .map(Note.fromLocalNote)
        .toList();
    _notes.addAll(localNotes);
    _notesStreamController.add(_notes);
  }

  Future<void> updateOne(UpdateNoteInput updateInput, String currentId) async {
    final localNote = await _localNotesService.getOneById(currentId);
    if (localNote == null) {
      throw const CrudCannotFindResourcesexception(
        'The note must exists in order to update it.',
      );
    }
    final isCurrentLocalNoteExistsInTheCloud = localNote.cloudId != null;

    var shouldUpdateInTheCloud = false;
    var newUpdateInput = updateInput;

    final isSyncWithCloudNewInput = updateInput.syncOptions.isSyncWithCloud;
    final isExistInCloudUpdateInput = updateInput.syncOptions.isExistsInCloud;

    AppLogger.log('Is sync with cloud = $isSyncWithCloudNewInput');
    AppLogger.log('Is existing in cloud = $isCurrentLocalNoteExistsInTheCloud');

    // Create the note if it does not exists and user want to sync
    if (isSyncWithCloudNewInput && !isExistInCloudUpdateInput) {
      AppLogger.log(
        'We will sync this note to the cloud by creating it and update the local note',
      );
      final userId = AuthService.getInstance()
          .requireCurrentUser(
            'In order to sync the note to the cloud by creating it and update it locally\n'
            'user must be authenticated.',
          )
          .id;
      final cloudNote = await _cloudNotesService.createOne(
        CreateNoteInput(
          text: updateInput.text,
          syncOptions: updateInput.syncOptions,
          isPrivate: updateInput.isPrivate,
          userId: userId,
        ),
      );
      shouldUpdateInTheCloud = true;
      newUpdateInput = newUpdateInput.copyWith(
        syncOptions: SyncOptions.syncWithExistingCloudId(cloudNote.id),
      );
    } else if (!isSyncWithCloudNewInput && isCurrentLocalNoteExistsInTheCloud) {
      // If the current note is exists and the user want to unsync the note.
      AppLogger.log(
        'Delete the existing note in the cloud since the user no longer want to sync it',
      );
      AuthService.getInstance().requireCurrentUser(
        'In order to sync the note to the cloud by deleting it and update it locally\n'
        'user must be authenticated.',
      );
      final cloudNoteId = localNote.cloudId;
      if (cloudNoteId == null) {
        throw ArgumentError(
          'The isCurrentLocalNoteExistsInTheCloud is true while the cloudNoteId is null which does not make any sense\n'
          'Please check isCurrentLocalNoteExistsInTheCloud in the update function',
        );
      }
      await _cloudNotesService.deleteOneById(cloudNoteId);
      shouldUpdateInTheCloud = true;
    }

    final newNote = Note.fromLocalNote(
      await _localNotesService.updateOne(newUpdateInput, currentId),
    );

    final index =
        _notes.indexWhere((currentNote) => currentNote.id == currentId);
    if (index != -1) {
      final note = _notes[index];
      _notes.removeAt(index);
      _notes.insert(0, newNote);
      _notesStreamController.add(_notes);

      if (shouldUpdateInTheCloud) {
        return;
      }

      final cloudNoteId = note.syncOptions.getCloudNoteId();
      if (cloudNoteId != null) {
        await _cloudNotesService.updateOne(
          updateInput,
          cloudNoteId,
        );
      }
      return;
    }
    AppLogger.error(
      "We couldn't find the index for the currentId of the updating note in NoteDataService, the id is = $currentId",
    );
  }

  Future<void> syncLocalNotesFromCloud() async {
    if (!isInitialized) {
      await initialize();
    }
    // Get the cloud notes with no pagination
    final cloudNotes = await _cloudNotesService.getAll(limit: -1, page: 1);
    if (cloudNotes.isEmpty) {
      return;
    }

    // Map them to inputs
    final createInputs = cloudNotes.map((cloudNote) {
      return CreateNoteInput.fromCloudNote(cloudNote);
    }).toList();

    // Delete all the local notes that have synced to insert the new ones
    final localNotes = await _localNotesService.getAll(limit: -1, page: 1);
    final localNotesIdsWithSync = localNotes
        .where((note) => note.isSyncWithCloud)
        .map((note) => note.id)
        .whereType<String>()
        .where((noteId) => noteId.trim().isNotEmpty)
        .toList();

    if (localNotesIdsWithSync.isNotEmpty) {
      await _localNotesService.deleteByIds(localNotesIdsWithSync);
    }

    await _localNotesService.createMultiples(createInputs);
  }

  Future<ListDifferenceResult<Note>> getCloudToLocalNotesDifferences() async {
    final cloudNotes = (await _cloudNotesService.getAll(limit: -1, page: 1))
        .map(Note.fromCloudNote)
        .toList();
    final localNotes = (await _localNotesService.getAll(limit: -1, page: 1))
        .map(Note.fromLocalNote)
        .toList();

    AppLogger.log('The cloud notes length is = ${cloudNotes.length}');
    AppLogger.log('The local notes length is = ${localNotes.length}');

    final cloudNotesTextx = cloudNotes.map((e) => e.text);
    final localNotesTextx = localNotes.map((e) => e.text);

    final commonsNotesByText = findCommons(
      cloudNotesTextx,
      localNotesTextx,
    ).toList();
    final commons = commonsNotesByText.asMap().entries.map(
          (e) => cloudNotes[e.key].copyWith(text: e.value),
        );
    AppLogger.log('Commons Length = ${commons.length} is $commons');

    final notesDifferencesByText = findDifferences(
      cloudNotesTextx,
      cloudNotesTextx,
      commonItems: commonsNotesByText,
    ).toList();
    final differences = notesDifferencesByText.asMap().entries.map((e) {
      return cloudNotes[e.key].copyWith(text: e.value);
    });
    AppLogger.log('Differences Length = ${differences.length} is $differences');

    final missingNotesByText = findMissings(
      cloudNotesTextx,
      localNotesTextx,
      // differences: notesDifferencesByText,
    ).toList();
    final missings = missingNotesByText.asMap().entries.map(
          (e) => cloudNotes[e.key].copyWith(text: e.value),
        );
    AppLogger.log('Missings Length = ${missings.length} is $missings');

    return ListDifferenceResult(
      differences: differences.toList(),
      commons: commons.toList(),
      missingsItems: missings.toList(),
    );
  }

  // @override
  // Future<List<Note>> getAllByIds(List<String> ids) async {
  //   final localNotes = (await _localNotesService.getAllByIds(ids))
  //       .map((e) => Note.fromLocalNote(e))
  //       .toList();
  //   _notes.addAll(localNotes);
  //   _notesStreamController.add(_notes);
  //   return localNotes;
  // }

  // @override
  // Future<Note?> getOneById(String id) async {
  //   final note = await _localNotesService.getOneById(id);
  //   if (note == null) return null;
  //   return Note.fromLocalNote(note);
  // }
}
