import 'package:meta/meta.dart' show immutable;

import '../data/core/cloud/storage/s_cloud_storage.dart';
import '../data/core/local/storage/s_local_storage.dart';
import '../data/notes/cloud/s_cloud_notes.dart';
import '../data/notes/local/s_local_notes.dart';
import '../logic/auth/auth_service.dart';
import '../logic/native/connection/s_connection_checker.dart';
import '../logic/native/image/s_image_picker.dart';
import '../logic/native/share/s_app_share.dart';

@immutable
class AppModule {
  const AppModule._();
  // Notes
  static final LocalNotesService localNotesService =
      LocalNotesService.sqflite();
  static final CloudNotesService cloudNotesService =
      CloudNotesService.firebaseFirestore();
  static final CloudStorageService cloudStorageService =
      CloudStorageService.firebase();
  static final LocalStorageService localStorageService =
      LocalStorageService.defaultImpl();

  // Other Service
  static final AuthService authService = AuthService.firebase();
  static final ImagePickerService imagePickerService =
      ImagePickerService.packageImagePicker();
  static final AppShareService appShareService = AppShareService.sharePlus();
  static final ConnectionCheckerService connectionCheckerService =
      ConnectionCheckerService.connectivityPlus();
}
