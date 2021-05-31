import 'package:flutter/material.dart';
import '/global/colors/light_colors.dart';
import '/global/texts/light_text.dart';

class LightTheme {
  ThemeData lightTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      accentColor: accentColor,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: scaffoldColor,
      textTheme: lightTextTheme,
      //inputtext theme
      inputDecorationTheme: InputDecorationTheme(
        fillColor: backgroundColor,
        filled: true,
        labelStyle: TextStyle(
            color: Color.fromRGBO(1, 1, 87, 1),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        hintStyle: TextStyle(
          color: Color.fromRGBO(180, 179, 186, 1),
          fontSize: 16,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
      ),
      //button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
              lightTextTheme.headline1!.color!),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: primaryColor),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      //card or container theme
      cardTheme: CardTheme(
        margin: EdgeInsets.all(5),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Color.fromRGBO(135, 134, 147, 1),
      ),
    );
  }
}
