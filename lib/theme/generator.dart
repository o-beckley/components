import 'package:flutter/material.dart';

MaterialColor createColorSwatch(Color color) {
  List strengths = <double>[
    0,
    .10,
    .20,
    .30,
    .40,
    .50,
    .60,
    .70,
    .80,
    .90,
    .94,
    .95,
    .98,
    .99,
    1
  ];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (var strength in strengths) {
    // final double ds = 0.4 - strength;
    final double ds = 2 * strength - 1;
    swatch[(strength * 100).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
