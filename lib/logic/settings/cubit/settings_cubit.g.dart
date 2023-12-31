// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsStateImpl _$$SettingsStateImplFromJson(Map<String, dynamic> json) =>
    _$SettingsStateImpl(
      isAnimationsEnabled: json['isAnimationsEnabled'] as bool? ?? true,
      confirmDeleteNote: json['confirmDeleteNote'] as bool? ?? true,
      confirmMoveNoteToTrash: json['confirmMoveNoteToTrash'] as bool? ?? false,
      useNoteGridTile: json['useNoteGridTile'] as bool? ?? true,
      syncWithCloudDefaultValue:
          json['syncWithCloudDefaultValue'] as bool? ?? false,
      onlySaveDataWhenClick: json['onlySaveDataWhenClick'] as bool? ?? true,
      darkDuringDayInAutoMode: json['darkDuringDayInAutoMode'] ?? false,
      openOnBoardingScreen: json['openOnBoardingScreen'] as bool? ?? true,
      autoSaveNote: json['autoSaveNote'] as bool? ?? true,
      themeMode:
          $enumDecodeNullable(_$AppThemeModeEnumMap, json['themeMode']) ??
              AppThemeMode.system,
      appLanguague:
          $enumDecodeNullable(_$AppLanguagueEnumMap, json['appLanguague']) ??
              AppLanguague.system,
      themeSystem:
          $enumDecodeNullable(_$AppThemeSystemEnumMap, json['themeSystem']) ??
              AppThemeSystem.material3,
      layoutMode:
          $enumDecodeNullable(_$AppLayoutModeEnumMap, json['layoutMode']) ??
              AppLayoutMode.auto,
    );

Map<String, dynamic> _$$SettingsStateImplToJson(_$SettingsStateImpl instance) =>
    <String, dynamic>{
      'isAnimationsEnabled': instance.isAnimationsEnabled,
      'confirmDeleteNote': instance.confirmDeleteNote,
      'confirmMoveNoteToTrash': instance.confirmMoveNoteToTrash,
      'useNoteGridTile': instance.useNoteGridTile,
      'syncWithCloudDefaultValue': instance.syncWithCloudDefaultValue,
      'onlySaveDataWhenClick': instance.onlySaveDataWhenClick,
      'darkDuringDayInAutoMode': instance.darkDuringDayInAutoMode,
      'openOnBoardingScreen': instance.openOnBoardingScreen,
      'autoSaveNote': instance.autoSaveNote,
      'themeMode': _$AppThemeModeEnumMap[instance.themeMode]!,
      'appLanguague': _$AppLanguagueEnumMap[instance.appLanguague]!,
      'themeSystem': _$AppThemeSystemEnumMap[instance.themeSystem]!,
      'layoutMode': _$AppLayoutModeEnumMap[instance.layoutMode]!,
    };

const _$AppThemeModeEnumMap = {
  AppThemeMode.dark: 'dark',
  AppThemeMode.light: 'light',
  AppThemeMode.system: 'system',
  AppThemeMode.auto: 'auto',
  AppThemeMode.random: 'random',
};

const _$AppLanguagueEnumMap = {
  AppLanguague.system: 'system',
  AppLanguague.en: 'en',
  AppLanguague.ar: 'ar',
};

const _$AppThemeSystemEnumMap = {
  AppThemeSystem.material3: 'material3',
  AppThemeSystem.material2: 'material2',
  AppThemeSystem.cupertino: 'cupertino',
  AppThemeSystem.fluentUi: 'fluentUi',
};

const _$AppLayoutModeEnumMap = {
  AppLayoutMode.auto: 'auto',
  AppLayoutMode.small: 'small',
  AppLayoutMode.large: 'large',
};
