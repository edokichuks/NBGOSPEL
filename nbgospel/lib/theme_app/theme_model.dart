import 'package:flutter/cupertino.dart';
import 'theme_app.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark;

  late ThemePreferenceMain _preferenceMain;

  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    _preferenceMain = ThemePreferenceMain();
    getPreferences();
  }

  getPreferences() async {
    _preferenceMain = ThemePreferenceMain();
    _isDark = await _preferenceMain.getTheme();
    notifyListeners();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferenceMain.setTheme(value);
    notifyListeners();
  }
}
