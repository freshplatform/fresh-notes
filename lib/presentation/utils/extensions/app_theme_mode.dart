import 'package:flutter/material.dart';

import '../../../logic/settings/cubit/settings_cubit.dart';

extension AppThemeModeExtensions on AppThemeMode {
  ThemeMode toMaterialThemeMode({required bool darkDuringDayInAutoMode}) {
    switch (this) {
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.system:
        return ThemeMode.system;
      case AppThemeMode.auto:
        // TODO: This logic could be improved much better
        final date = DateTime.now();
        final hours = date.hour;
        if (hours >= 1 && hours <= 12) {
          if (darkDuringDayInAutoMode) {
            return ThemeMode.dark;
          }
          return ThemeMode.light;
        } else if (hours >= 12 && hours <= 16) {
          if (darkDuringDayInAutoMode) {
            return ThemeMode.dark;
          }
          return ThemeMode.light;
        } else if (hours >= 16 && hours <= 21) {
          if (darkDuringDayInAutoMode) {
            return ThemeMode.light;
          }
          return ThemeMode.dark;
        } else if (hours >= 21 && hours <= 24) {
          if (darkDuringDayInAutoMode) {
            return ThemeMode.light;
          }
          return ThemeMode.dark;
        }
        return ThemeMode.dark;
    }
  }
}
