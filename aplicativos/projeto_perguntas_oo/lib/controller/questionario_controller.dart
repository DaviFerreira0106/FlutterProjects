import 'package:flutter/material.dart';
import 'package:projeto_perguntas_oo/model/pergunta.dart';
import 'package:projeto_perguntas_oo/model/questao.dart';
import 'package:projeto_perguntas_oo/view/questao_view.dart';

class QuestionarioController extends StatelessWidget {
  final int perguntaIndex;
  final void Function(int) fn;

  const QuestionarioController({
    super.key,
    required this.perguntaIndex,
    required this.fn,
  });

  @override
  Widget build(BuildContext context){
    // Objeto Lista
    Pergunta objPergunta = Pergunta();

    // Objeto questão
    Questao objQuestao = Questao();
    objQuestao.setTexto = objPergunta.getListaPergunta.elementAt(perguntaIndex).cast()['questao'];

    
    return Column(
      children: <Widget>[
        QuestaoView(
          objPergunta: objQuestao,
        ),
        // ...listaResposta.map(
        //   (resp) => Resposta(
        //     fn: () => fn(int.parse(resp["pontuacao"].toString())),
        //     texto: resp["texto"].toString(),
        //   ),
        // ),
      ],
    );
  }
}