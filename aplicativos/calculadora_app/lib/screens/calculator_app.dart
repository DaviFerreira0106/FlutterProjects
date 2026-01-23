import 'package:flutter/material.dart';
import 'package:calculadora_app/components/display.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Display(text: '123456'),
          Text('keyboard'),
        ],
      ),
    );
  }
}
