import 'package:flutter/material.dart';
import 'package:ocean_park/global/colors/light_colors.dart';
import 'package:ocean_park/global/texts/light_input_decoration.dart';
import 'package:ocean_park/global/texts/light_text.dart';

class LightTheme {
  ThemeData lightTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      accentColor: accentColor,
      scaffoldBackgroundColor: scaffoldColor,
      textTheme: Lighttexttheme,
      //inputtext theme
      inputDecorationTheme: decoration,
      //button theme
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
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
