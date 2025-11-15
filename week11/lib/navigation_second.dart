import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hammam Abdullah'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Red'),
              onPressed: () {
                Navigator.pop(context, Colors.red); 
              },
            ),
            ElevatedButton(
              child: const Text('Green'),
              onPressed: () {
                Navigator.pop(context, Colors.green);
              },
            ),
            ElevatedButton(
              child: const Text('Blue'),
              onPressed: () {
                Navigator.pop(context, Colors.blue); 
              },
            ),
          ],
        ),
      ),
    );
  }
}