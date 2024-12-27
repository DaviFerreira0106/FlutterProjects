import 'package:flutter/material.dart';

void main() {
  runApp(Perguntas());
}

class Perguntas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Center(
          child: Text("Olá Flutter!!!!!"),
        ),
      ),
    );
  }
}
