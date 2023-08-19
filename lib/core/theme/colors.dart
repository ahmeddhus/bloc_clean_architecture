import 'package:flutter/material.dart';

const Color blackColor = Color(0xFF000000);
const Color whiteColor = Color(0xFFFFFFFF);
const Color redColor = Color(0xFFE00000);

const ColorScheme colorSchemeLight = ColorScheme(
  background: whiteColor,
  onBackground: whiteColor,
  primary: whiteColor,
  primaryContainer: blackColor,
  secondary: blackColor,
  secondaryContainer: blackColor,
  brightness: Brightness.light,
  onPrimary: blackColor,
  onSecondary: whiteColor,
  error: redColor,
  onError: whiteColor,
  surface: whiteColor,
  onSurface: blackColor,
);
