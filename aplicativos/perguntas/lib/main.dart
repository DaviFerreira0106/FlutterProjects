import 'package:flutter/material.dart';
import 'package:perguntas/questao.dart';
import 'package:perguntas/resposta.dart';

void main() {
  runApp(Perguntas());
}

class _PerguntasState extends State<Perguntas> {
  int _perguntaIndex = 0;

  void _respoder() {
    setState(
      () {
        _perguntaIndex++;
      },
    );
    print("Respondido!!!!!");
  }

  final List<String> perguntas = [
    "Qual sua cor favorita?",
    "Qual seu animal favorito?",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Perguntas"),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Questao(texto: perguntas.elementAt(_perguntaIndex)),
              Resposta(
                fn: _respoder,
                texto: "Resposta 1",
              ),
              Resposta(
                fn: _respoder,
                texto: "Resposta 2",
              ),
              Resposta(
                fn: _respoder,
                texto: "Resposta 3",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Perguntas extends StatefulWidget {
  @override
  _PerguntasState createState() {
    return _PerguntasState();
  }
}
