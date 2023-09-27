import 'package:components/others/shadows.dart';
import 'package:flutter/material.dart';
import 'package:components/constants/constants.dart';

class CustomTonalButton extends StatelessWidget {
  final String label;
  final IconData? iconData;
  final bool elevated;
  final Accent accent;
  final VoidCallback? onTap;

  const CustomTonalButton({
    required this.label,
    this.iconData,
    this.elevated = false,
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
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: elevated ? [
                  customBoxShadow(Elevation.level1, context)
                ] : null
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: iconData != null ? 16 : 24,
                  right: 24
                ),
                child: Center(
                  child: Row(
                    children: [
                      iconData != null
                      ? Icon(
                        iconData,
                        color: color,
                      )
                      : const SizedBox.shrink(),
                      iconData != null
                      ? const SizedBox(width: 8)
                      : const SizedBox.shrink(),
                      Text(
                        label,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: color
                        ),
                      ),
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}