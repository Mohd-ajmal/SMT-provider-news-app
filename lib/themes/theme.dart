import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white38,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.teal,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      bodyText2: TextStyle(
        color: Colors.black87,
        fontSize: 18.0,
      ),
    ),
    tabBarTheme: const TabBarTheme(
        labelColor: Colors.black, indicatorSize: TabBarIndicatorSize.label),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black26,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      bodyText2: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.yellow,
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: Colors.white,
    ),
  );
}
