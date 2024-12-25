import 'aparelhoEletrnico.dart';

class TV implements AparelhoEletronico {
  @override
  void ligar(){
    print("Tv Ligada!");
  }

  @override
  void desligar(){
    print("Tv desligada!");
  }
}