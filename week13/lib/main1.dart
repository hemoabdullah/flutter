import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyAppPrak1());
}

class MyAppPrak1 extends StatelessWidget {
  const MyAppPrak1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practicum 1 - JSON Basics - Hemo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(praktikum: 1),
    );
  }
}
