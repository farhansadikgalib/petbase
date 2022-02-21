import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MyThemeProvider extends BaseViewModel {
  ThemeMode themeMode = ThemeMode.light;

  // bool get isDarkMode => themeMode == ThemeMode.dark;

  toggleTheme(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }
}