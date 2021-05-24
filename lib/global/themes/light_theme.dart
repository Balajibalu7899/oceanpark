import 'package:flutter/material.dart';
import 'package:ocean_park/global/colors/light_colors.dart';
import 'package:ocean_park/global/texts/light_input_decoration.dart';
import 'package:ocean_park/global/texts/light_text.dart';

class LightTheme {
  ThemeData lightTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      accentColor: accentColor,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: scaffoldColor,
      textTheme: lighttexttheme,
      //inputtext theme
      inputDecorationTheme: decoration,
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
              lighttexttheme.headline1!.color!),
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
        margin: EdgeInsets.all(10),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Color.fromRGBO(135, 134, 147, 1),
      ),
    );
  }
}
