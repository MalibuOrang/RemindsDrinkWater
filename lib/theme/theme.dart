import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 59, 57, 57),
  iconTheme: const IconThemeData(color: Colors.white),
  dividerColor: Colors.grey,
  cardColor: Colors.blue,
  hoverColor: Colors.blueGrey,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Color.fromARGB(255, 59, 57, 57),
    elevation: 0,
    titleTextStyle: TextStyle(
        backgroundColor: Colors.blueGrey,
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700),
  ),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  useMaterial3: true,
  textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontWeight: FontWeight.w700,
        fontSize: 18,
      )),
  colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.red,
      backgroundColor: Colors.lightBlue,
      cardColor: Colors.white),
);
