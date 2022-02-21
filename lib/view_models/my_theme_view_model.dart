import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyThemeProvider extends BaseViewModel {
  ThemeMode themeMode = ThemeMode.light;

  // bool get isDarkMode => themeMode == ThemeMode.dark;

  getMyTheme() async{
    final _prefs = await SharedPreferences.getInstance();
    String? value = _prefs.getString("myTheme");
    if(value == "dark") {
      themeMode = ThemeMode.dark;
    } else if(value == "light"){
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  saveMyTheme(ThemeMode value) async{
    final _prefs = await SharedPreferences.getInstance();
    if(value == ThemeMode.dark) {
      await _prefs.setString("myTheme", "dark");
    } else if(value == ThemeMode.light) {
      await _prefs.setString("myTheme", "light");
    } else {
      await _prefs.setString("myTheme", "system");
    }
  }

  toggleTheme(ThemeMode theme) async{
    await saveMyTheme(theme);
    themeMode = theme;
    notifyListeners();
  }
}