import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/notes/cloud/models/m_cloud_note.dart';
import '../../local/models/m_local_note.dart';
import 'm_note.dart';

part 'm_note_inputs.freezed.dart';

@freezed
class CreateNoteInput with _$CreateNoteInput {
  const factory CreateNoteInput({
    required String noteId,
    required String title,
    required String text,
    required bool isSyncWithCloud,
    required bool isPrivate,
    required bool isFavorite,
    required String? userId,
  }) = _CreateNoteInput;
  factory CreateNoteInput.fromCloudNote(CloudNote note) => CreateNoteInput(
        noteId: note.noteId,
        title: note.title,
        text: note.text,
        isSyncWithCloud: true,
        isFavorite: note.isFavorite,
        isPrivate: note.isPrivate,
        userId: note.userId,
      );
  factory CreateNoteInput.fromUpdateInput(
    UpdateNoteInput input, {
    required String userId,
  }) =>
      CreateNoteInput(
        noteId: input.noteId,
        title: input.title,
        text: input.text,
        isSyncWithCloud: input.isSyncWithCloud,
        isPrivate: input.isPrivate,
        isFavorite: input.isFavorite,
        userId: userId,
      );

  factory CreateNoteInput.fromUniversalNote(UniversalNote note) =>
      CreateNoteInput(
        isPrivate: note.isPrivate,
        noteId: note.noteId,
        text: note.text,
        title: note.title,
        isSyncWithCloud: note.isSyncWithCloud,
        isFavorite: note.isFavorite,
        userId: note.userId,
      );
}

@freezed
class UpdateNoteInput with _$UpdateNoteInput {
  const factory UpdateNoteInput({
    required String noteId,
    required String? userId,
    required String text,
    required String title,
    required bool isSyncWithCloud,
    required bool isPrivate,
    required bool isFavorite,
    required bool isTrash,
  }) = _UpdateNoteInput;

  factory UpdateNoteInput.fromCreateInput(CreateNoteInput input,
          {required bool isTrash}) =>
      UpdateNoteInput(
        noteId: input.noteId,
        text: input.text,
        title: input.title,
        isSyncWithCloud: input.isSyncWithCloud,
        isPrivate: input.isPrivate,
        isFavorite: input.isFavorite,
        isTrash: isTrash,
        userId: input.userId,
      );

  factory UpdateNoteInput.fromUniversalNote(UniversalNote note) =>
      UpdateNoteInput(
        isTrash: note.isTrash,
        isPrivate: note.isPrivate,
        noteId: note.noteId,
        text: note.text,
        title: note.title,
        isSyncWithCloud: note.isSyncWithCloud,
        isFavorite: note.isFavorite,
        userId: note.userId,
      );

  factory UpdateNoteInput.fromLocalNote(LocalNote note) => UpdateNoteInput(
        isTrash: note.isTrash,
        isPrivate: note.isPrivate,
        noteId: note.noteId,
        text: note.text,
        title: note.title,
        isSyncWithCloud: note.isSyncWithCloud,
        userId: note.userId,
        isFavorite: note.isFavorite,
      );

  factory UpdateNoteInput.fromCloudNote(CloudNote note) => UpdateNoteInput(
        noteId: note.noteId,
        text: note.text,
        title: note.title,
        isSyncWithCloud: true,
        isPrivate: note.isPrivate,
        isTrash: note.isTrash,
        userId: note.userId,
        isFavorite: note.isFavorite,
      );
}
