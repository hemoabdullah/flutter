import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyAppPrak3());
}

class MyAppPrak3 extends StatelessWidget {
  const MyAppPrak3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practicum 3 - JSON Error Handling - Hemo Abdullah',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(praktikum: 3),
    );
  }
}
