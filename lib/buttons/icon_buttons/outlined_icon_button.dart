import 'package:components/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomOutlinedIconButton extends StatelessWidget {
  final Accent accent;
  final IconData iconData;
  final VoidCallback? onTap;

  const CustomOutlinedIconButton({
    required this.iconData,
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
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox.square(
          dimension: 40,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: color
              )
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