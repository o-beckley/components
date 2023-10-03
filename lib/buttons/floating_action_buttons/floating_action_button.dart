import 'package:components/constants/constants.dart';
import 'package:components/others/shadows.dart';
import 'package:components/others/tonal_elevation.dart';
import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final IconData iconData;
  final Accent accent;
  final Size size;
  final bool floating;
  final VoidCallback? onTap;

  const CustomFAB({
    required this.iconData,
    this.accent = Accent.primary,
    this.size = Size.medium,
    this.floating = true,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    double containerSize = switch(size){
      Size.large => 96,
      Size.medium || Size.small => 56,
    };
    double iconSize = switch(size){
      Size.large => 36,
      Size.medium || Size.small => 24,
    };
    double radius = switch(size){
      Size.large => 28,
      Size.medium || Size.small=> 16,
    };
    Color backgroundColor = switch(accent){
      Accent.primary => Theme.of(context).colorScheme.surface,
      Accent.secondary => Theme.of(context).colorScheme.secondaryContainer,
      Accent.tertiary => Theme.of(context).colorScheme.tertiaryContainer,
    };
    Color color = switch(accent){
      Accent.primary => Theme.of(context).colorScheme.primary,
      Accent.secondary => Theme.of(context).colorScheme.onSecondaryContainer,
      Accent.tertiary => Theme.of(context).colorScheme.onTertiaryContainer,
    };
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: containerSize,
        width: containerSize,
        child: Container(
          decoration: BoxDecoration(
            color: tonalElevation(
              backgroundColor,
              floating ? Elevation.level0 : Elevation.level3
            ),
            borderRadius: BorderRadius.circular(radius),
            boxShadow: floating ? [
              customBoxShadow(Elevation.level3, context)
            ] : null
          ),
          child: Center(
            child: Icon(
              iconData,
              color: color,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}