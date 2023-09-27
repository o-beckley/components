import 'package:components/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomFilledIconButton extends StatelessWidget {
  final Accent accent;
  final IconData iconData;
  final VoidCallback? onTap;

  const CustomFilledIconButton({
    required this.iconData,
    this.accent = Accent.primary,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = switch(accent){
      Accent.primary => Theme.of(context).colorScheme.primary,
      Accent.secondary => Theme.of(context).colorScheme.secondary,
      Accent.tertiary => Theme.of(context).colorScheme.tertiary,
    };
    Color color = switch(accent){
      Accent.primary => Theme.of(context).colorScheme.onPrimary,
      Accent.secondary => Theme.of(context).colorScheme.onSecondary,
      Accent.tertiary => Theme.of(context).colorScheme.onTertiary,
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