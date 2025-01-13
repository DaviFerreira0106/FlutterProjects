import 'package:flutter/material.dart';
import 'package:perguntas/questionario.dart';
import 'package:perguntas/resultado.dart';

void main() {
  runApp(const Perguntas());
}

class PerguntasState extends State<Perguntas> {
  int _perguntaIndex = 0;
  int _pontuacaoTotal = 0;

  void _respoder(int pontuacao) {
    if (temPerguntaSelecionada()) {
      setState(
        () {
          _perguntaIndex++;
          _pontuacaoTotal += pontuacao;
        },
      );
    }
  }

  void _reiniciar() {
    setState(() {
      _perguntaIndex = 0;
      _pontuacaoTotal = 0;
    });
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      "questao": "Qual sua cor favorita?",
      "alternativa": [
        {"texto": "Branco", "pontuacao": 10},
        {"texto": "Verde", "pontuacao": 8},
        {"texto": "Azul", "pontuacao": 4},
        {"texto": "Vermelho", "pontuacao": 1},
      ],
    },
    {
      "questao": "Qual seu animal favorito?",
      "alternativa": [
        {"texto": "Leão", "pontuacao": 10},
        {"texto": "Cobra", "pontuacao": 8},
        {"texto": "Macaco", "pontuacao": 4},
        {"texto": "Gavião", "pontuacao": 1},
      ],
    },
    {
      "questao": "Qual seu instrutor favorito?",
      "alternativa": [
        {"texto": "Davi", "pontuacao": 10},
        {"texto": "Laura", "pontuacao": 8},
        {"texto": "Mariana", "pontuacao": 4},
        {"texto": "Elenita", "pontuacao": 1},
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
              : Resultado(pontuacao: _pontuacaoTotal, fnReiniciar: _reiniciar,),
        ),
      ),
    );
  }
}

class Perguntas extends StatefulWidget {
  const Perguntas({super.key});

  @override
  PerguntasState createState() {
    return PerguntasState();
  }
}
