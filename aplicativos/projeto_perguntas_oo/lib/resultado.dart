import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Resultado extends StatelessWidget {
  final int? resultado;
  final void Function()? quandoReiniciarQuestionario;

  const Resultado({
    super.key,
    this.resultado,
    this.quandoReiniciarQuestionario,
  });

  String get fraseResultado {
    if (resultado! < 8) {
      return 'Parabens!';
    } else if (resultado! < 12) {
      return 'Você é bom!';
    } else if (resultado! < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text('Reiniciar?',
              style: TextStyle(fontSize: 18, color: Colors.blue)),
        ),
      ],
    );
  }
}
