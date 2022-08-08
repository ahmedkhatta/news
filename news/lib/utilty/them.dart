  import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'colors.dart';

final ThemeData light =  ThemeData(
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black),
  ),
  primarySwatch: Colors.deepOrange,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey.shade400,
      selectedItemColor: Colors.deepPurple,
      elevation: 20),
);


  final ThemeData dark = ThemeData(
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white)),
    primarySwatch: Colors.deepOrange,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: mainColors,
    appBarTheme: AppBarTheme(
      backgroundColor: mainColors,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:mainColors,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black38,
        selectedItemColor: Colors.deepPurple,
        elevation: 20),
  );