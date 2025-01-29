import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 3,
    ),
    borderRadius: BorderRadius.circular(15),
  );

    //Getter for _border
  static OutlineInputBorder border(Color color) => _border(color);

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Palette.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: border(Palette.borderColor),
      focusedBorder: border(Palette.gradient2)
    )
  );
}