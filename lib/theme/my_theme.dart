import 'package:flutter/material.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/theme/primary_swatch_color_pallete.dart';

class MyTheme {
  static final darkTheme = ThemeData(
    // fontFamily: "SF Pro Display",
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.white,
    primaryColor: Colors.white,
    primarySwatch: Palette.kToLight,
    colorScheme: const ColorScheme.dark(),
    // iconTheme: IconThemeData(
    //   color: Colors.white,
    // ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
    ),
    cardColor: kCardColorD,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        // height: 1.5,
      ),
      // bodyText2: TextStyle(
      //   color: kTextSubHeadingColor,
      //   fontSize: s,
      // ),
      // headline1: TextStyle(
      //     color: kWhite,
      //     fontSize: l,
      //     fontWeight: FontWeight.bold
      // ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      fillColor: kCardColorD,
      filled: true,
    ),
    // textSelectionTheme: TextSelectionThemeData(cursorColor: kVideoColor),
    // dialogTheme: DialogTheme(
    //   backgroundColor: kCardColorD,
    // ),

  );


  static final lightTheme = ThemeData(
    // fontFamily: "SF Pro Display",
    scaffoldBackgroundColor: appBgColor,
    primaryColor: primary,
    primarySwatch: Palette.kToDark,
    backgroundColor: Colors.black,
    colorScheme: const ColorScheme.light(),
    // iconTheme: IconThemeData(
    //   color: Colors.black,
    // ),
    appBarTheme: const AppBarTheme(
      backgroundColor: appBgColor,
      foregroundColor: primary,
      elevation: 0,
      centerTitle: false,
    ),
    cardColor: kCardColorL,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: textColor,
        // height: 1.5,
      ),
      // bodyText2: TextStyle(
      //   color: kTextSubHeadingColor,
      //   fontSize: s,
      // ),
      // headline1: TextStyle(
      //     color: kWhite,
      //     fontSize: l,
      //     fontWeight: FontWeight.bold
      // ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black),),
      fillColor: Colors.white,
      filled: true,
    ),
    // textSelectionTheme: TextSelectionThemeData(cursorColor: kVideoColor),
    // dialogTheme: DialogTheme(
    //   backgroundColor: kCardColorL,
    // ),

  );
}