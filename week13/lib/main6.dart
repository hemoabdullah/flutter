import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyAppPrak6());
}

class MyAppPrak6 extends StatelessWidget {
  const MyAppPrak6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practicum 6 - Read/Write File - Hemo Abdullah',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(praktikum: 6),
    );
  }
}
