import 'package:flutter/material.dart';

void main() {
  runApp(const ComponentApp());
}

class ComponentApp extends StatelessWidget {
  const ComponentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'components',
      home: Scaffold()
    );
  }
}