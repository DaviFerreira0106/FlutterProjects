import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String? texto;
  final void Function()? quandoSelecionado;

  const Resposta({
    super.key,
    this.texto,
    this.quandoSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: quandoSelecionado,
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
        ),
        child: Text(
          texto!,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
