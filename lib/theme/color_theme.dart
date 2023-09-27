import 'package:flutter/material.dart';
import 'package:components/theme/generator.dart';

MaterialColor primaryColor = createColorSwatch(const Color(0xff008080)); // teal
MaterialColor secondaryColor = createColorSwatch(const Color(0xffdfc5fe)); // lavender
MaterialColor tertiaryColor = createColorSwatch(const Color(0xfffc8eac)); // flamingo
MaterialColor errorColor = createColorSwatch(const Color(0xffb90e0a)); // crimson
MaterialColor neutralColor = createColorSwatch(const Color(0xff555555)); // davy's gray
MaterialColor neutralVariantColor = createColorSwatch(const Color(0xff333333)); // pebble
Color shadowColor = const Color(0xff373737); // shadow

ColorScheme lightScheme =  ColorScheme.light(
  primary: primaryColor[40]!,
  onPrimary: primaryColor[100]!,
  primaryContainer: primaryColor[90],
  onPrimaryContainer: primaryColor[10],
  inversePrimary: primaryColor[80],

  secondary: secondaryColor[40]!,
  onSecondary: secondaryColor[100]!,
  secondaryContainer: secondaryColor[90],
  onSecondaryContainer: secondaryColor[10],

  tertiary: tertiaryColor[40],
  onTertiary: tertiaryColor[100],
  tertiaryContainer: tertiaryColor[90],
  onTertiaryContainer: tertiaryColor[10],

  error: errorColor[40]!,
  onError: errorColor[100]!,
  errorContainer: errorColor[90],
  onErrorContainer: errorColor[10],

  outline: neutralVariantColor[50],
  outlineVariant: neutralVariantColor[80],

  surface: neutralColor[94]!,
  onSurface: neutralColor[10]!,
  onSurfaceVariant: neutralVariantColor[30],
  inverseSurface: neutralColor[20],
  onInverseSurface: neutralColor[95],

  background: neutralColor[99]!,
  onBackground: neutralColor[10]!,

  shadow: shadowColor
);