import 'package:flutter/material.dart';
import 'package:projeto_perguntas_oo/controller/questionario_controller.dart';
import 'package:projeto_perguntas_oo/model/pergunta.dart';
import 'package:projeto_perguntas_oo/model/resposta.dart';

class PerguntaControllerState extends State<PerguntaController> {
  Pergunta obj = Resposta();

  @override
  Widget build(BuildContext context) {
    setState(() {
      obj.responder(pontuacao)
    });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Perguntas"),
          ),
        ),
        body: QuestionarioController(perguntaIndex: perguntaIndex, fn: fn),
      ),
    );
  }
}

class PerguntaController extends StatefulWidget {
  const PerguntaController({super.key});

  @override
  PerguntaControllerState createState() {
    return PerguntaControllerState();
  }
}
