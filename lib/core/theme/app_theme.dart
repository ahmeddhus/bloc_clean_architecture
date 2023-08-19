import 'package:flutter/material.dart';
import 'package:valu_store_app/core/theme/colors.dart';

mixin AppTheme {
  static final ThemeData appTheme = ThemeData(
    useMaterial3: true,
    colorScheme: colorSchemeLight,
    brightness: Brightness.light,
    scaffoldBackgroundColor: whiteColor,
    primaryColor: blackColor,
    primaryColorLight: whiteColor,
    primaryColorDark: blackColor,
    canvasColor: whiteColor,
    splashColor: blackColor.withOpacity(0.1),
    highlightColor: blackColor.withOpacity(0.1),
    cardColor: whiteColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        height: 1.5,
        color: colorSchemeLight.secondary,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: colorSchemeLight.secondary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.5,
        color: colorSchemeLight.secondary,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        height: 1.5,
        color: colorSchemeLight.secondary,
      ),
    ),
  );
}
