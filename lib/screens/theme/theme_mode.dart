import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {
  ThemeChanger() {
    loadTheme();
  }
  ThemeMode _themeMode = ThemeMode.light;
  bool isdark = false;
  get thememode => _themeMode;
  loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isDark = prefs.getBool('isDarkTheme') ?? false;
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Future<void> toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', isDark);
    // print(isDark);
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
