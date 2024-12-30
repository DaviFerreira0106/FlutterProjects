import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int? pontuacao;
  final void Function()? fnReiniciar;

  const Resultado({super.key, this.pontuacao, this.fnReiniciar});

  String get frasePontuacao {
    if (pontuacao! < 8) {
      return "Parabens!";
    } else if (pontuacao! < 12) {
      return "Você é Bom!";
    } else {
      return "Você é muito Bom!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            frasePontuacao,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: fnReiniciar,
          child: const Text(
            "Reiniciar?",
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
