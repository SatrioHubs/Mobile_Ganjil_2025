import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: const Text('Navigation Dialog Screen')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }

  _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Crimson Red'),
              onPressed: () {
                color = const Color.fromARGB(255, 110, 8, 8);
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Lime Green'),
              onPressed: () {
                color = const Color.fromARGB(255, 84, 232, 92);
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Sea Blue'),
              onPressed: () {
                color = const Color.fromARGB(255, 8, 40, 72);
                Navigator.pop(context, color);
              },
            ),
          ],
        );
      },
    );
    setState(() {});
  }
}
