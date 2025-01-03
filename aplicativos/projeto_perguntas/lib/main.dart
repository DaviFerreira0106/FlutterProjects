import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(PerguntaApp());

//Classe que gerência o estado da aplicação
class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual sua cor favorita ?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Branco', 'pontuacao': 7},
        {'texto': 'Azul', 'pontuacao': 4},
        {'texto': 'Vermelho', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual seu animal favorito ?',
      'resposta': [
        {'texto': 'Leão', 'pontuacao': 10},
        {'texto': 'Tigre', 'pontuacao': 7},
        {'texto': 'Macaco', 'pontuacao': 4},
        {'texto': 'Cobra', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual seu instrutor favorito ?',
      'resposta': [
        {'texto': 'Davi', 'pontuacao': 10},
        {'texto': 'Mariana', 'pontuacao': 7},
        {'texto': 'Elenita', 'pontuacao': 4},
        {'texto': 'Carlito', 'pontuacao': 1},
      ],
    }
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Perguntas',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                pergunta: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(
                resultado: _pontuacaoTotal,
                quandoReiniciarQuestionario: _reiniciarQuestionario,
              ),
      ),
    );
  }
}

//Classe que chama a classe que gerência o estado da aplicação
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
