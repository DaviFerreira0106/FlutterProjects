import 'package:flutter/widgets.dart';

class Resultado extends StatelessWidget {
  final int? resultado;

  const Resultado({
    super.key,
    this.resultado,
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
    return Center(
      child: Text(
        fraseResultado,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
