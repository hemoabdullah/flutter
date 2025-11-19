import 'dart:async';

void main() {
  // Create a stream that emits numbers from 0 to 9
  Stream<int> numberStream = Stream<int>.fromIterable([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);

  // Listen to the stream and print each number
  numberStream.listen((number) {
    print('Number: $number');
  });
}
