import 'package:flutter/material.dart';
import 'package:components/constants/constants.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final IconData? iconData;
  final Accent accent;
  final VoidCallback? onTap;

  const CustomTextButton({
    required this.label,
    this.iconData,
    this.accent = Accent.primary,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    Color color = switch(accent){
      Accent.primary => Theme.of(context).colorScheme.primary,
      Accent.secondary => Theme.of(context).colorScheme.secondary,
      Accent.tertiary => Theme.of(context).colorScheme.tertiary,
    };
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: iconData != null ? 16 : 12,
                left: 12
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
          ],
        ),
      ),
    );
  }
}