import 'package:flutter/material.dart';
import 'package:min_animations/min_animations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Container(
          width: 100,
          height: 100,
          color: Colors.grey.shade300,
          child: const Center(
            child: Text(
              'Flip',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ).flipAnimation(
          duration: const Duration(milliseconds: 1000),
          end: 0.0,
          begin: 3.14159,
          curve: Curves.linear,
          reverse: false,
        )),
      ),
    );
  }
}
