import 'package:components/constants/constants.dart';
import 'package:components/others/tonal_elevation.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final List<Widget> actions;
  final Widget? fab;
  const CustomBottomAppBar({
    required this.actions,
    this.fab,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: (tonalElevation(Theme.of(context).colorScheme.surface, Elevation.level2)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 4,
            right: 16,
            top: 12,
            bottom: 12
          ),
          child: Row(
            children: [
              ... actions,
              const Expanded(child: SizedBox()),
              fab ?? const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}