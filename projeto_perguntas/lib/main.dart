import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

void main() => runApp(PerguntaApp());

//Classe que gerência o estado da aplicação
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual sua cor favorita ?',
      'resposta': ['Preto', 'Branco', 'Azul', 'Vermelho'],
    },
    {
      'texto': 'Qual seu animal favorito ?',
      'resposta': ['Leão', 'Tigre', 'Macaco', 'Cobra'],
    },
    {
      'texto': 'Qual seu instrutor favorito ?',
      'resposta': ['Davi', 'Mariana', 'Elenita', 'Carlito'],
    }
  ];

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> resposta = temPerguntaSelecionada
        ? _perguntas.elementAt(_perguntaSelecionada).cast()['resposta']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(
                      texto: _perguntas
                          .elementAt(_perguntaSelecionada)['texto']
                          .toString()),
                  ...resposta.map(
                    (t) => Resposta(texto: t, quandoSelecionado: _responder),
                  ),
                ],
              )
            : Resultado(),
      ),
    );
  }
}

//Classe que chama a classe que gerência o estado da aplicação
class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
