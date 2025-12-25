import 'package:flutter/material.dart';
import 'dart:async';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
}

class NumberStream {
  final _streamController = StreamController<int>();

  void addNumberToSink(int number) {
    _streamController.sink.add(number);
  }

  Stream<int> get stream => _streamController.stream;

  StreamController<int> get controller => _streamController;

  void close() {
    _streamController.close();
  }
}
