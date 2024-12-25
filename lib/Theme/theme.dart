import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    color: Color.fromRGBO(200, 228, 178, 1),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color.fromRGBO(126, 170, 146, 1),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontSize: 15),
    bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
    titleLarge: TextStyle(color: Colors.black, fontSize: 20),
  ),
);

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(color: Color.fromRGBO(126, 170, 146, 1)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color.fromRGBO(126, 170, 146, 1),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white70, fontSize: 10),
    bodyMedium: TextStyle(color: Colors.white70, fontSize: 8),
    titleLarge: TextStyle(color: Colors.white70, fontSize: 20),
  ),
);
