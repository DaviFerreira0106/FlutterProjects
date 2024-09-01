import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  final List<String> perguntas = [
    'Qual sua cor favorita ?',
    'Qual seu animal favorito ?',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas.elementAt(0)),
            ElevatedButton(
              onPressed: null,
              child: Text('Resposta 1'),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('Resposta 2'),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('Resposta 3'),
            ),
          ],
        ),
      ),
    );
  }
}
