import 'package:flutter/material.dart';

class PerguntaAppOO extends StatelessWidget {
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'resposta': ['Amarela', 'Azul', 'Vermelha', 'Roxa'],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'resposta': ['Leão', 'Tigre', 'Rinoceronte', 'Macaco']
    },
    {
      'texto': 'Qual seu instrutor favorite?',
      'resposta': ['Mariana', 'Laura', 'Elenita', 'Carlito']
    },
  ];

  int? _perguntaSelecionada =1;

  PerguntaAppOO({super.key});

  final String Function(Map) _pegarPerguntas = (perguntaMap) => perguntaMap['texto'];
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Perguntas"),
          ),
          body: Column(
            children: [
              Text(_perguntas.map(_pegarPerguntas).elementAt(_perguntaSelecionada!))
            ],
          )),
    );
  }
}
