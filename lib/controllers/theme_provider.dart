import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var _darkMode = false;
  bool get darkMode => _darkMode;
  void toggleThemeMode() {
    _darkMode ^= true;
    notifyListeners();
  }
}
