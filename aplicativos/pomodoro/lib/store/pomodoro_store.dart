import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

enum TipoIntervalo { trabalho, descanso }

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int minuto = 2;

  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.descanso;

  @observable
  Timer? cronometro;

  @action
  void iniciar() {
    iniciado = true;
    cronometro = Timer.periodic(Duration(seconds: 1), (timer) {
      if (minuto == 0 && segundos == 0) {
        _alterarIntervalo();
      } else if (segundos == 0) {
        minuto--;
        segundos = 59;
      } else {
        segundos--;
      }
    });
  }

  @action
  void parar() {
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void reiniciar() {
    parar();
    if (minuto == 0 && segundos == 0) {
      return;
    } else if (segundos != 0 && estaTrabalhando()) {
      minuto = tempoTrabalho;
      segundos = 0;
    } else if (segundos != 0 && estaDescansando()) {
      minuto = tempoDescanso;
      segundos = 0;
    }
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
    if (estaDescansando()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoDescanso() {
    if (tempoDescanso > 1) {
      tempoDescanso--;
      if (estaDescansando()) {
        reiniciar();
      }
    }
  }

  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
    if (estaTrabalhando()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoTrabalho() {
    if (tempoTrabalho > 1) {
      tempoTrabalho--;
      if (estaTrabalhando()) {
        reiniciar();
      }
    }
  }

  bool estaTrabalhando() => tipoIntervalo == TipoIntervalo.trabalho;

  bool estaDescansando() => tipoIntervalo == TipoIntervalo.descanso;

  @action
  void _alterarIntervalo() {
    if (estaTrabalhando()) {
      minuto = tempoDescanso;
      tipoIntervalo = TipoIntervalo.descanso;
    } else {
      minuto = tempoTrabalho;
      tipoIntervalo = TipoIntervalo.trabalho;
    }
  }
}
