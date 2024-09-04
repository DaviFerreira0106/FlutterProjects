import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(PerguntaApp());

//Classe que gerência o estado da aplicação
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Qual sua cor favorita ?',
      'resposta' : ['Preto', 'Branco', 'Azul', 'Vermelho'],
    },
    {
      'texto': 'Qual seu animal favorito ?',
      'resposta' : ['Leão', 'Tigre', 'Macaco', 'Cobra'],
    }, 
    {
      'texto' : 'Qual seu instrutor favorito ?',
      'resposta' : ['Davi', 'Mariana', 'Elenita', 'Carlito'],
    }
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
            Questao(texto: perguntas.elementAt(_perguntaSelecionada)['texto'].toString()),
            Resposta(
              texto: 'Resposta 1',
              quandoSelecionado: _responder,
            ),
            Resposta(
              texto: 'Resposta 2',
              quandoSelecionado: _responder,
            ),
            Resposta(
              texto: 'Resposta 3',
              quandoSelecionado: _responder,
            ),
          ],
        ),
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
