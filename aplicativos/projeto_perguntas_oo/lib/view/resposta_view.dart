import 'package:flutter/material.dart';

class RespostaView extends StatelessWidget {
  final String? texto;
  final void Function()? fn;

  const RespostaView({super.key, this.texto, this.fn});

  @override
  Widget build(BuildContext context){
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