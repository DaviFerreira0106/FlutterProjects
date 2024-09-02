import 'package:flutter/material.dart';
import './questao.dart';

void main() => runApp(PerguntaApp());

//Classe que gerência o estado da aplicação
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

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
            Questao(texto: perguntas.elementAt(_perguntaSelecionada)),
            ElevatedButton(
              onPressed: _responder,
              child: const Text('Resposta 1'),
            ),
            ElevatedButton(
              onPressed: _responder,
              child: const Text('Resposta 2'),
            ),
            ElevatedButton(
              onPressed: _responder,
              child: const Text('Resposta 3'),
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
