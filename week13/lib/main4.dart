import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyAppPrak4());
}

class MyAppPrak4 extends StatelessWidget {
  const MyAppPrak4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practicum 4 - Hemo Abdullah',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(praktikum: 4),
    );
  }
}
