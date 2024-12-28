import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String? texto;
  final void Function()? fn;

  const Resposta({
    super.key,
    this.texto,
    this.fn,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: fn,
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.blue),
        ),
        child: Text(
          texto!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
