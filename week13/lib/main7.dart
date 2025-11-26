import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyAppPrak7());
}

class MyAppPrak7 extends StatelessWidget {
  const MyAppPrak7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practicum 7 - Secure Storage - Hemo Abdullah',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(praktikum: 7),
    );
  }
}
