import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometro_botao.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            color: store.estaTrabalhando() ? Colors.red : Colors.green,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                store.estaTrabalhando()
                    ? 'Hora de Trabalhar'
                    : 'Hora de Descansar',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              Text(
                '${store.minuto.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 120, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!store.iniciado)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CronometroBotao(
                        text: 'Iniciar',
                        icon: Icons.play_arrow,
                        onClick: store.iniciar,
                      ),
                    ),
                  if (store.iniciado)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CronometroBotao(
                        text: 'Parar',
                        icon: Icons.stop,
                        onClick: store.parar,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CronometroBotao(
                      text: 'Reiniciar',
                      icon: Icons.refresh,
                      onClick: store.reiniciar,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
