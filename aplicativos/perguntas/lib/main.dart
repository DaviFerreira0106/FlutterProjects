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

  final List<Map<String, Object>> perguntas = [
    {
      "questao": "Qual sua cor favorita?",
      "alternativa": ["Branco", "Verde", "Azul", "Vermelho"],
    },
    {
      "questao": "Qual seu animal favorito?",
      "alternativa": ["Leão", "Cobra", "Macaco", "Gavião"],
    },
    {
      "questao": "Qual seu instrutor favorito?",
      "alternativa": ["Davi", "Laura", "Mariana", "Elenita"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<String> listaResposta = perguntas.elementAt(_perguntaIndex).cast()["alternativa"];

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
              Questao(
                texto: perguntas.elementAt(_perguntaIndex).cast()['questao'],
              ),
              ...listaResposta
                  .map(
                    (texto) => Resposta(
                      fn: _respoder,
                      texto: texto,
                    ),
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
