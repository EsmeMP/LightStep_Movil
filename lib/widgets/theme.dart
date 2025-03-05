import 'package:flutter/material.dart';

ThemeData tema1() {
  return ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 46, 14, 43),
    // scaffoldBackgroundColor: const Color.fromARGB(255, 109, 14, 99),

    // Estilo del AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 149, 19, 175),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    ),

    // Estilos de texto
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: const Color.fromARGB(255, 0, 46, 52),
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    ),

    // 🔹 Estilo del BottomNavigationBar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    ),
  );
}
