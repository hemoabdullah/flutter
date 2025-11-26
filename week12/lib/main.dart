import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'color_stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 12 Streams Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  final ColorStream _colorStream = ColorStream();
  final NumberStream _numberStream = NumberStream();

  Color _bgColor = Colors.blueGrey;
  int _lastNumber = 0;

  StreamSubscription<Color>? _colorSubscription;
  StreamSubscription<int>? _numberSubscription;

  @override
  void initState() {
    super.initState();

    // Auto background color cycle (Prac 1 behavior)
    _colorSubscription = _colorStream.getColors().listen((color) {
      setState(() {
        _bgColor = color;
      });
    });

    // Number stream listener (Prac 2+ behavior, without error handling)
    _numberSubscription = _numberStream.stream.listen((value) {
      setState(() {
        _lastNumber = value;
      });
    });
  }

  void _addRandomNumber() {
    final random = Random().nextInt(10); // 0-9
    _numberStream.addNumberToSink(random);
  }

  void _stopNumberSubscription() {
    _numberSubscription?.cancel();
    _numberSubscription = null;
  }

  @override
  void dispose() {
    _colorSubscription?.cancel();
    _numberSubscription?.cancel();
    _numberStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streams Playground (Prac 1-5)'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: _bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Last number: $_lastNumber',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _addRandomNumber,
              child: const Text('New Random Number (0-9)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _stopNumberSubscription,
              child: const Text('Stop Number Subscription'),
            ),
          ],
        ),
      ),
    );
  }
}
