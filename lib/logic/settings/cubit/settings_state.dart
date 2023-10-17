part of 'settings_cubit.dart';

enum AppThemeMode {
  dark,
  light,
  system,
  auto,
}

enum AppLanguague {
  en,
  ar,
  system,
}

// final class AppThemeSystemJsonConveter
//     extends JsonConverter<AppThemeSystem, Map<String, Object?>> {
//   const AppThemeSystemJsonConveter();
//   @override
//   AppThemeSystem fromJson(Map<String, Object?> json) {
//     throw const AppThemeSystem();
//   }

//   @override
//   Map<String, Object?> toJson(AppThemeSystem object) {
//     throw {};
//   }
// }

// final class MaterialThemeSystemJsonConveter
//     extends JsonConverter<MaterialThemeSystem, Map<String, Object?>> {
//   const MaterialThemeSystemJsonConveter();

//   @override
//   MaterialThemeSystem fromJson(Map<String, Object?> json) {
//     return MaterialThemeSystem(
//       useMaterial3: json['useMaterial3'] as bool,
//     );
//   }

//   @override
//   Map<String, Object?> toJson(MaterialThemeSystem object) {
//     return {
//       'useMaterial3': object.useMaterial3,
//     };
//   }
// }

// @immutable
// @JsonSerializable(converters: [AppThemeSystemJsonConveter()])
// class AppThemeSystem {
//   const AppThemeSystem();
// }

// @JsonSerializable(converters: [
//   MaterialThemeSystemJsonConveter(),
// ])
// final class MaterialThemeSystem extends AppThemeSystem {
//   const MaterialThemeSystem({
//     required this.useMaterial3,
//   });

//   final bool useMaterial3;
// }

enum AppThemeSystem {
  material3,
  material2,
  cupertino,
  fluentUi,
}

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(true) bool confirmDeleteNote,
    @Default(false) bool syncWithCloudDefaultValue,
    @Default(true) bool onlySaveDataWhenClick,
    @Default(false) darkDuringDayInAutoMode,
    @Default(AppThemeMode.system) AppThemeMode themeMode,
    @Default(AppLanguague.system) AppLanguague appLanguague,
    @Default(
      AppThemeSystem.material3,
    )
    AppThemeSystem themeSystem,
  }) = _SettingsState;
  factory SettingsState.fromJson(Map<String, Object?> json) =>
      _$SettingsStateFromJson(json);
}
