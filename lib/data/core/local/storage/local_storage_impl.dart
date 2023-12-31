import 'dart:io' show File, Directory;

import 'package:path/path.dart' as path;

import 'local_storage_exceptions.dart';
import 'local_storage_repository.dart';

class LocalStorageImpl extends LocalStorageRepository {
  @override
  Future<List<File>> copyMultipleFile({
    required List<File> files,
    required List<String> names,
    required Directory directory,
  }) async {
    if (files.length != names.length) {
      throw ArgumentError('Both arryas should have the same length');
    }
    final newFiles = <File>[];
    try {
      for (final (index, file) in files.indexed) {
        final newFilePath = path.join(directory.path, names[index]);
        await file.copy(newFilePath);
        newFiles.add(File(newFilePath));
      }
      return newFiles;
    } catch (e) {
      throw LocalStorageCopyException(
        'Error while copy on the files: ${e.toString()}',
      );
    }
  }
}
