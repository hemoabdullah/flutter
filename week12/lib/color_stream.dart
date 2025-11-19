import 'dart:async';
import 'package:flutter/material.dart';

class ColorStream {
  Stream<Color> getColors() async* {
    final List<Color> colors = [
      Colors.blueGrey,
      Colors.amber,
      Colors.deepPurple,
      Colors.lightBlue,
      Colors.teal,
      Colors.lightGreen,
      Colors.pink,
      Colors.blueAccent,
      Colors.cyan,
      Colors.purple,
    ];

    yield* Stream.periodic(
      const Duration(seconds: 1),
      (int t) => colors[t % colors.length],
    );
  }
}

class NumberStream {
  final StreamController<int> _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;
  Sink<int> get sink => _controller.sink;

  void addNumberToSink(int number) {
    sink.add(number);
  }

  void addError() {
    _controller.addError('Something went wrong!');
  }

  void close() {
    _controller.close();
  }
}
