import 'package:flutter/material.dart';
import '/global/colors/light_colors.dart';

final InputDecorationTheme decoration = InputDecorationTheme(
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
);
