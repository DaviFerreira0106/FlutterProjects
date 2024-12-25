import 'radio.dart';
import 'relogio.dart';

class RadioRelogio implements Radio, Relogio {
  @override
  void ligar() {
    print("Ligar Radio Relógio");
  }

  @override
  void desligar() {
    print("Desligar Radio Relógio");
  }

  @override
  void trocarEstacao() {
    print("Trocando estação do rádio relógio");
  }

  @override
  void verHoras() {
    print("Agora são 23:00 horas!");
  }
}