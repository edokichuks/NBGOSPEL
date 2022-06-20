import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferenceMain {
  static const KEY = 'key';

  setTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(KEY, value);
  }

  getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(KEY) ?? NullThrownError();
  }
}
