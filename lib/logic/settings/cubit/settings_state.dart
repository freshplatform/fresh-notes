part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(true) bool confirmDeleteNote,
    @Default(true) bool useNoteGridTile,
    @Default(false) bool syncWithCloudDefaultValue,
    @Default(true) bool onlySaveDataWhenClick,
    @Default(false) darkDuringDayInAutoMode,
    @Default(AppThemeMode.system) AppThemeMode themeMode,
    @Default(AppLanguague.system) AppLanguague appLanguague,
    @Default(AppThemeSystem.material3) AppThemeSystem themeSystem,
    @Default(AppLayoutMode.auto) AppLayoutMode layoutMode,
    @Default(true) bool openOnBoardingScreen,
  }) = _SettingsState;
  factory SettingsState.fromJson(Map<String, Object?> json) =>
      _$SettingsStateFromJson(json);
}
