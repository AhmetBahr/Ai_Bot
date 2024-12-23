import 'package:flutter/material.dart';
import 'package:ai_bot_test/Theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  bool _isSelected = false;
  bool get isSelected => _isSelected;

  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkmode;
    } else {
      _themeData = lightMode;
    }
    _isSelected = !_isSelected;
    notifyListeners();
  }
}
