import 'aparelhoEletrnico.dart';

class Celular implements AparelhoEletronico {
  @override
  void ligar(){
    print("Celular ligado!");
  }

  @override
  void desligar() {
    print("Celular desligado!");
  }
}