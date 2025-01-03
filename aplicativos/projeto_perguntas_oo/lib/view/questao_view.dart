import 'package:flutter/material.dart';
import 'package:projeto_perguntas_oo/model/questao.dart';

class QuestaoView extends StatelessWidget {
  final Questao? objPergunta;

  const QuestaoView({super.key, this.objPergunta});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          objPergunta!.getTexto,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
