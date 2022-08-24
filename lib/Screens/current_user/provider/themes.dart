import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black),
      backgroundColor: Colors.white),
  primaryColor: Colors.black,
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.grey,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(primary: Colors.grey),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  cardTheme: const CardTheme(elevation: 30, shadowColor: Colors.black),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.white,
    ),
  ),
);
