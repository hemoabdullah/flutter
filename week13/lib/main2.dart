import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyAppPrak2());
}

class MyAppPrak2 extends StatelessWidget {
  const MyAppPrak2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practicum 2 - JSON Model -  Hemo Abdullah',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(praktikum: 2),
    );
  }
}
