import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

String? fontFamily = GoogleFonts.abhayaLibre().fontFamily;

myTheme(BuildContext context) => ThemeData(
    primaryColor: Colors.red,
    appBarTheme: AppBarTheme(backgroundColor: Theme.of(context).primaryColor),
    textTheme: TextTheme(
        headlineLarge: TextStyle(
            color: black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily),
        displayLarge: TextStyle(
            color: black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily),
        titleLarge: TextStyle(
            color: black,
            fontSize: 24,
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold),
        titleMedium:
            TextStyle(color: black, fontSize: 18, fontFamily: fontFamily),
        titleSmall:
            TextStyle(color: greyblack, fontSize: 14, fontFamily: fontFamily),
        labelSmall:
            TextStyle(color: greyblack, fontSize: 12, fontFamily: fontFamily),
        bodySmall:
            TextStyle(color: black, fontSize: 10, fontFamily: fontFamily),
        displayMedium:
            TextStyle(color: black, fontSize: 24, fontFamily: fontFamily),
        displaySmall:
            TextStyle(color: black, fontSize: 20, fontFamily: fontFamily),
        headlineMedium: TextStyle(
            color: black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily),
        headlineSmall: TextStyle(
            color: grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily),
        bodyLarge:
            TextStyle(color: black, fontSize: 16, fontFamily: fontFamily),
        bodyMedium:
            TextStyle(color: black, fontSize: 12, fontFamily: fontFamily),
        labelLarge: const TextStyle(
            fontWeight: FontWeight.bold, fontFamily: "Traditional")));
