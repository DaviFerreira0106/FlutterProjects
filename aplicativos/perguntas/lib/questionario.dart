import 'package:flutter/material.dart';
import 'package:perguntas/questao.dart';
import 'package:perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaIndex;
  final List<Map<String, Object>> perguntas;
  final void Function() fn;

  const Questionario({
    super.key,
    required this.perguntaIndex,
    required this.perguntas,
    required this.fn,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> listaResposta = perguntas.elementAt(perguntaIndex).cast()["alternativa"];

    return Column(
      children: <Widget>[
        Questao(
          texto: perguntas.elementAt(perguntaIndex).cast()['questao'],
        ),
        ...listaResposta.map(
          (texto) => Resposta(
            fn: fn,
            texto: texto["texto"].toString(),
          ),
        ),
      ],
    );
  }
}
