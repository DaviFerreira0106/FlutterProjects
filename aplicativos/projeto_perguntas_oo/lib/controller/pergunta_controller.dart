import 'package:flutter/material.dart';
import 'package:projeto_perguntas_oo/controller/questionario_controller.dart';
import 'package:projeto_perguntas_oo/model/pergunta.dart';
import 'package:projeto_perguntas_oo/model/resposta.dart';
import 'package:projeto_perguntas_oo/model/resultado.dart';
import 'package:projeto_perguntas_oo/view/resultado_view.dart';

class PerguntaControllerState extends State<PerguntaController> {
  Pergunta obj = Resposta();
  Resultado objResult = Resultado();

  void _responder(int pontuacao) {
    setState(() {
      obj.responder(pontuacao);
    });
  }

  void _reiniciar() {
    setState(() {
      obj.reiniciar();
    });
  }

  bool temPerguntaSelecionada() {
    return obj.getListaIndex < obj.getListaPergunta.length;
  }

  // Setando pontuação total

  @override
  Widget build(BuildContext context) {
    objResult.setPontuacao = obj.getPontuacaoTotal;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Perguntas"),
          ),
        ),
        body: temPerguntaSelecionada()
            ? QuestionarioController(
                perguntaIndex: obj.getListaIndex, fn: _responder)
            : ResultadoView(
                objResultado: objResult,
                fnReiniciar: _reiniciar,
              ),
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
