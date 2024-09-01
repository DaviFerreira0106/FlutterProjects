import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp());


class PerguntaApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: const Text('Olá Mundo!!!!'),
      ),
    );
  }
}
