import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyAppPrak5());
}

class MyAppPrak5 extends StatelessWidget {
  const MyAppPrak5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practicum 5 - Paths - Hemo Abdullah',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(praktikum: 5),
    );
  }
}
