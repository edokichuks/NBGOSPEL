import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    AppThemeM.GreyDark: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.grey[900],
    ),
    AppThemeM.GreyLight: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.grey[400],
    ),
    AppThemeM.GreenLight: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green,
    ),
    AppThemeM.GreenDark: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.green[700],
    ),
  };
}

enum AppThemeM {
  GreenLight,
  GreenDark,
  GreyLight,
  GreyDark,
}
