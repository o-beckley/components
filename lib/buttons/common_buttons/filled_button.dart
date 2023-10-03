import 'package:components/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String label;
  final IconData? iconData;
  final Accent accent;
  final VoidCallback? onTap;

  const CustomFilledButton({
    required this.label,
    this.iconData,
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
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20),
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