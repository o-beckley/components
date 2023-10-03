import 'package:components/cards/card.dart';
import 'package:components/navigation/bottom_app_bar.dart';
import 'package:components/others/scrim.dart';
import 'package:components/others/shadows.dart';
import 'package:components/others/tonal_elevation.dart';
import 'package:components/theme/color_theme.dart';
import 'package:components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:components/buttons/buttons.dart';
import 'package:components/constants/constants.dart';
void main() {
  runApp(const ComponentApp());
}

class ComponentApp extends StatelessWidget {
  const ComponentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'components',
      theme: theme,
      home:  Scaffold(
        backgroundColor: LightAppColor.surface,
        bottomNavigationBar: const CustomBottomAppBar(
          actions: [
            CustomIconButton(iconData: Icons.person, accent: Accent.secondary,),
            CustomIconButton(iconData: Icons.mic, accent:  Accent.secondary,),
            CustomIconButton(iconData: Icons.delete, accent: Accent.secondary,),
            CustomIconButton(iconData: Icons.image_outlined, accent: Accent.secondary,),
          ],
          fab: CustomFAB(accent: Accent.secondary, iconData: Icons.add, floating: false,),
        ),
        body: Stack(
          children: [
            Scrim(
              active: true,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomFilledButton(label: 'hello world',iconData: Icons.add, accent: Accent.secondary),
                    CustomTonalButton(label: 'hello world', accent: Accent.secondary),
                    CustomElevatedButton(label: 'hello world'),
                    CustomOutlinedButton(label: 'Add to books', accent: Accent.secondary,),
                    CustomFAB(iconData: Icons.edit, accent: Accent.tertiary, floating: true, size: Size.large,),
                    CustomExtendedFAB(label: "Deez", iconData: Icons.add, accent: Accent.primary,),
                    CustomTextButton(label: 'Hello world', iconData: Icons.face,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomIconButton(iconData: Icons.edit, accent: Accent.secondary,),
                        CustomFilledIconButton(iconData: Icons.add),
                        CustomTonalIconButton(iconData: Icons.add, accent: Accent.tertiary,),
                        CustomOutlinedIconButton(iconData: Icons.code)
                      ]
                    ),
                    SizedBox.square(
                      dimension: 50,
                      child: Stack(
                        children: [
                          Scrim(child: Container(color: Colors.blue), active: true,),
                          Center(
                            child: SizedBox.square(
                              dimension: 20,
                              child: Container(color: Colors.red,),
                            )
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(Elevation.values.length, (index){
                        return SizedBox.square(
                          dimension: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: tonalElevation(Colors.white, Elevation.values[index]),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [customBoxShadow(Elevation.values[index], context)]
                            )
                          ),
                        );
                      }),
                    )
                  ],
                )
              ),
            ),
            const Center(child: CustomElevatedCard(
              width: 300,
              // imagePath: 'assets/snake.webp',
              headline: 'Small Headline',
              subHead: 'Subhead',
              supportingText: 'Explain more about the topic shown in the headline and subhead through supporting text',
              actions: [
                CustomTonalButton(label: "hello",accent: Accent.tertiary,),
                CustomFilledButton(label: "world", accent: Accent.secondary,),
              ],
              ))
          ]
        )
      )
    );
  }
}