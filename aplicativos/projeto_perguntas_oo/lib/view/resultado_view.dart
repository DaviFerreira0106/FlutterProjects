import 'package:flutter/material.dart';
import 'package:projeto_perguntas_oo/model/resultado.dart';

class ResultadoView extends StatelessWidget {
  final Resultado? objResultado;
  final void Function()? fnReiniciar;

  const ResultadoView({super.key, this.objResultado, this.fnReiniciar});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            objResultado!.frasePontuacao,
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
