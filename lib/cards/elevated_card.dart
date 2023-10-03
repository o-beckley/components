import 'package:components/constants/constants.dart';
import 'package:components/others/shadows.dart';
import 'package:components/others/tonal_elevation.dart';
import 'package:flutter/material.dart';

class CustomElevatedCard extends StatelessWidget {
  final String? imagePath;
  final String? headline;
  final String? subHead;
  final String? supportingText;
  final double width;
  final List<Widget> actions;
  final VoidCallback? onTap;

  const CustomElevatedCard({
    this.imagePath,
    this.headline,
    this.subHead,
    this.supportingText,
    this.width = 300,
    this.actions = const <Widget>[],
    this.onTap,
    super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Container(
        decoration: BoxDecoration(
          color: tonalElevation(
            Theme.of(context).colorScheme.surface,
            Elevation.level1
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [customBoxShadow(Elevation.level2, context)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            imagePath != null
              ? SizedBox(
                // height: 200,
                width: width,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(imagePath!),
                  ),
                ),
              )
              : const SizedBox.shrink(),
            headline != null
              ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8
                ),
                child: Text(
                  headline!,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              )
              : const SizedBox.shrink(),
            subHead != null
              ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4
                ),
                child: Text(
                  subHead!,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
              : const SizedBox.shrink(),
            supportingText != null
              ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8
                ),
                child: Text(
                  supportingText!,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              )
              : const SizedBox.shrink(),
              actions.isNotEmpty 
                ? Wrap(
                  children: [
                    const SizedBox(width: 12,),
                    ...List.generate(actions.length, (index){
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 4,
                          right: 4,
                          bottom: 16
                        ),
                        child: actions[index],
                      );
                    }),
                    const SizedBox(width: 12,),
                  ],
                )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}