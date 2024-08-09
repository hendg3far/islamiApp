import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppConfig extends ChangeNotifier {

  String language = 'en';
  ThemeMode appTheme = ThemeMode.light;

  AppConfig() {
    _loadPreferences();
  }

  void changeLanguage(String newLanguage) async {
    if (language == newLanguage) {
      return;
    }
    language = newLanguage;
    notifyListeners();
    await _savePreference('language', newLanguage);
  }

  void changeThemeMode(ThemeMode theme) async {
    if (appTheme == theme) {
      return;
    }
    appTheme = theme;
    notifyListeners();
    await _savePreference('theme', theme == ThemeMode.light ? 'light' : 'dark');
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    language = prefs.getString('language') ?? 'en';
    final themeString = prefs.getString('theme') ?? 'light';
    appTheme = themeString == 'light' ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  Future<void> _savePreference(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

}