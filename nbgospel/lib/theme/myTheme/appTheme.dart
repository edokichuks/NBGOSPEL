import 'package:flutter/material.dart';

enum AppThemeM {
  GreyLight,
  GreyDark,
  GreenLight,
  GreenDark,
}

final appThemeData = {
  AppThemeM.GreyDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[900],
  ),
  AppThemeM.GreyLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.grey[900],
  ),
  AppThemeM.GreenDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[700],
  ),
  AppThemeM.GreenLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
  ),
};
