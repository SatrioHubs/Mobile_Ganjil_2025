import 'package:flutter/material.dart';
import 'red_text_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Containers',
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.yellowAccent,
                width: 50,
                child: const RedTextWidget(
                  text: 'You have pushed the button this many times:',
                ),
              ),
              const SizedBox(height: 12),
              Container(
                color: Colors.greenAccent,
                width: 100,
                child: const Text(
                  'You have pushed the button this many times:',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
