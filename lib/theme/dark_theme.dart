import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white)),
  drawerTheme: const DrawerThemeData(
      elevation: 1,
      scrimColor: Color.fromARGB(236, 11, 11, 11),
      backgroundColor: Colors.black),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Colors.white),
  ),
);
