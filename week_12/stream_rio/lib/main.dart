import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Rio',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
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
  int lastNumber = 0;
  late StreamController<int> numberStreamController;
  late NumberStream numberStream;

  // Transformer to multiply numbers by 10 and handle errors
  late StreamTransformer<int, int> transformer;

  // Background color stream
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
  StreamSubscription<Color>? colorSubscription;

  @override
  void initState() {
    super.initState();

    // Stream transformer per your snippet
    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10);
      },
      handleError: (error, trace, sink) {
        sink.add(-1);
      },
      handleDone: (sink) => sink.close(),
    );

    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;

    // Use transformed stream and handle errors
    stream
        .transform(transformer)
        .listen((event) {
          setState(() {
            lastNumber = event;
          });
        })
        .onError((error) {
          setState(() {
            lastNumber = -1;
          });
        });

    // Subscribe to color stream so background keeps changing
    colorStream = ColorStream();
    colorSubscription = colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  @override
  void dispose() {
    colorSubscription?.cancel();
    numberStream.close();
    super.dispose();
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    numberStream.addNumberToSink(myNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Rio')),
      body: Container(
        color: bgColor,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(lastNumber.toString()),
            ElevatedButton(
              onPressed: addRandomNumber,
              child: const Text('Add Number'),
            ),
          ],
        ),
      ),
    );
  }
}
