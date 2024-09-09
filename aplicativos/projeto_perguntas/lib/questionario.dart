import 'package:flutter/widgets.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> pergunta;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.pergunta,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < pergunta.length;
  }

  @override
  Widget build(BuildContext context) {
    
    List<Map<String, Object>> resposta = temPerguntaSelecionada
        ? pergunta.elementAt(perguntaSelecionada).cast()['resposta']
        : [];

    return Column(
      children: <Widget>[
        Questao(
          texto: pergunta.elementAt(perguntaSelecionada)['texto'].toString(),
        ),
        ...resposta.map(
          (t) => Resposta(
            texto: t['texto'] as String,
            quandoSelecionado: () => responder(int.parse(t['pontuacao'].toString())),//Função que retorna uma função 
          ),
        ),
      ],
    );
  }
}
