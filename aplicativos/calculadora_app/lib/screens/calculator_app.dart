import 'package:flutter/material.dart';
import 'package:calculadora_app/components/display.dart';
import 'package:calculadora_app/components/keyboard.dart';
import 'package:calculadora_app/model/memory.dart';
import 'package:flutter/services.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final Memory memory = Memory();

  void _onPressed(String command) {
    setState(() {
      memory.applyCommand(value: command);
    });
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      home: Column(
        children: [
          Display(text: memory.value),
          Keyboard(cb: _onPressed),
        ],
      ),
    );
  }
}
