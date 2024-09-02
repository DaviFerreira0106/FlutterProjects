import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String? texto;

  Questao({super.key, this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(texto!);
  }
}
