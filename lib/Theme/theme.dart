import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    color: Color.fromRGBO(200, 228, 178, 1),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color.fromRGBO(126, 170, 146, 1), // Seçili öğe rengi
    // unselectedItemColor: Colors.grey, // Seçili olmayan öğe rengi
    // backgroundColor: Colors.black, // Arkaplan rengi
  ),
);

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(color: Color.fromRGBO(126, 170, 146, 1)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color.fromRGBO(126, 170, 146, 1), // Seçili öğe rengi
    // unselectedItemColor: Colors.grey, // Seçili olmayan öğe rengi
    // backgroundColor: Colors.black, // Arkaplan rengi
  ),
);
