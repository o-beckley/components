import 'package:components/constants/constants.dart';
import 'package:components/others/shadows.dart';
import 'package:flutter/material.dart';

class CustomExtendedFAB extends StatelessWidget {
  final String label;
  final IconData? iconData;
  final Accent accent;
  final bool floating;
  final VoidCallback? onTap;

  const CustomExtendedFAB({
    required this.label,
    this.iconData,
    this.accent = Accent.secondary,
    this.floating = true,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
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
        height: 56,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: floating ? [
                  customBoxShadow(Elevation.level3, context)
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