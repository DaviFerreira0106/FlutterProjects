import 'package:flutter/material.dart';
import 'package:pomodoro/components/cronometro_botao.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.red),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hora de Trabalhar',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          Text('25:00', style: TextStyle(fontSize: 120, color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CronometroBotao(text: 'Iniciar', icon: Icons.play_arrow),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 10),
              //   child: CronometroBotao(text: 'Parar', icon: Icons.stop),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CronometroBotao(text: 'Reiniciar', icon: Icons.refresh),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
