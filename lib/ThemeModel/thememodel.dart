import 'package:flutter/cupertino.dart';

import '../Theme_Shared_Preference/theme_shared_preference.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark;
  late ThemeSharedPreferences themeSharedPreferences;
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    themeSharedPreferences = ThemeSharedPreferences();
    getThemePreference();
  }
  set isDark(bool value) {
    _isDark = value;
    themeSharedPreferences.setTheme(value);
    notifyListeners();
  }

  getThemePreference() async {
    _isDark = await themeSharedPreferences.getTheme();
    notifyListeners();
  }
}
