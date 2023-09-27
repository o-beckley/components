import 'package:components/constants/constants.dart';
import 'package:components/others/shadows.dart';
import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final IconData iconData;
  final Accent accent;
  final FabSize size;
  final bool floating;
  final VoidCallback? onTap;

  const CustomFAB({
    required this.iconData,
    this.accent = Accent.secondary,
    this.size = FabSize.medium,
    this.floating = true,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    double containerSize = switch(size){
      FabSize.large => 96,
      FabSize.medium => 56,
    };
    double iconSize = switch(size){
      FabSize.large => 36,
      FabSize.medium => 24,
    };
    double radius = switch(size){
      FabSize.large => 28,
      FabSize.medium => 16,
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
            color: backgroundColor,
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