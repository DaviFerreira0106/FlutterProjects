import 'package:flutter/material.dart';
import 'package:perguntas/questionario.dart';
import 'package:perguntas/resultado.dart';

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
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      "questao": "Qual sua cor favorita?",
      "alternativa": [
        {"texto": "Branco", "ponto": 10},
        {"texto": "Verde", "ponto": 8},
        {"texto": "Azul", "ponto": 4},
        {"texto": "Vermelho", "ponto": 1},
      ],
    },
    {
      "questao": "Qual seu animal favorito?",
      "alternativa": [
        {"texto": "Leão", "ponto": 10},
        {"texto": "Cobra", "ponto": 8},
        {"texto": "Macaco", "ponto": 4},
        {"texto": "Gavião", "ponto": 1},
      ],
    },
    {
      "questao": "Qual seu instrutor favorito?",
      "alternativa": [
        {"texto": "Davi", "ponto": 10},
        {"texto": "Laura", "ponto": 8},
        {"texto": "Mariana", "ponto": 4},
        {"texto": "Elenita", "ponto": 1},
      ],
    },
  ];

  bool temPerguntaSelecionada() {
    return _perguntaIndex < _perguntas.length;
  }

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
          child: temPerguntaSelecionada()
              ? Questionario(
                  perguntaIndex: _perguntaIndex,
                  perguntas: _perguntas,
                  fn: _respoder,
                )
              : const Resultado(),
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
