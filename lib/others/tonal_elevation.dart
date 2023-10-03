import 'package:components/constants/constants.dart';
import 'package:flutter/material.dart';

Color tonalElevation(Color color, Elevation level){
  double strength = switch (level) {
    Elevation.level0 => 0,
    Elevation.level1 => 0.01,
    Elevation.level2 => 0.02,
    Elevation.level3 => 0.06,
    Elevation.level4 => 0.08,
    Elevation.level5 => 0.12
  };
  int r = color.red;
  int g = color.green;
  int b = color.blue;
  return Color.fromRGBO(
      r - (r  * strength).round(),
      g - (g * strength).round(),
      b - (b * strength).round(),
      1,
  );
}