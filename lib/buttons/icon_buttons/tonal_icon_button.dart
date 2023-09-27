import 'package:components/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTonalIconButton extends StatelessWidget {
  final Accent accent;
  final IconData iconData;
  final VoidCallback? onTap;

  const CustomTonalIconButton({
    required this.iconData,
    this.accent = Accent.primary,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = switch(accent){
      Accent.primary => Theme.of(context).colorScheme.primaryContainer,
      Accent.secondary => Theme.of(context).colorScheme.secondaryContainer,
      Accent.tertiary => Theme.of(context).colorScheme.tertiaryContainer,
    };
    Color color = switch(accent){
      Accent.primary => Theme.of(context).colorScheme.onPrimaryContainer,
      Accent.secondary => Theme.of(context).colorScheme.onSecondaryContainer,
      Accent.tertiary => Theme.of(context).colorScheme.onTertiaryContainer,
    };
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox.square(
          dimension: 40,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor
            ),
            child: Icon(
              iconData,
              color: color,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}