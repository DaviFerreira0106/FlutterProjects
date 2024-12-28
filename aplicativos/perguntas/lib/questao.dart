import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String? texto;

  const Questao({super.key, this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        texto!,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}
