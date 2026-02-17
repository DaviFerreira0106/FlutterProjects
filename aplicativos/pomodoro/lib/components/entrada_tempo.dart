import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  final void Function()? inc;
  final void Function()? dec;
  const EntradaTempo({
    super.key,
    required this.titulo,
    required this.valor,
    this.inc,
    this.dec,
  });

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Column(
      children: [
        Text(titulo, style: TextStyle(fontSize: 20)),
        SizedBox(height: 10),
        Observer(
          builder: (_) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: dec,
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: store.estaTrabalhando()
                      ? Colors.red
                      : Colors.green,
                ),
                child: Icon(Icons.arrow_downward, color: Colors.white),
              ),
              Text('$valor min', style: TextStyle(fontSize: 16)),
              ElevatedButton(
                onPressed: inc,
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: store.estaTrabalhando()
                      ? Colors.red
                      : Colors.green,
                ),
                child: Icon(Icons.arrow_upward, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
