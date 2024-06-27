import 'package:change_theme/presentation/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  static const String key = "theme";
  SharedPreferences prefs;
  late ThemeType theme;

  ThemeNotifier(this.prefs) {
    try {
      final savedTheme = prefs.getString(key);
      theme = savedTheme == null
          ? ThemeType.system
          : ThemeType.values.firstWhere((e) => e.toString() == savedTheme);
    } catch (e) {
      theme = ThemeType.system;
    }
  }

  void setTheme(ThemeType theme) {
    this.theme = theme;
    prefs.setString(key, theme.toString());
    notifyListeners();
  }
}
