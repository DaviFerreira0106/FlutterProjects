import 'aparelhoEletrnico.dart';
import 'celular.dart';
import 'tv.dart';

void main(){
  AparelhoEletronico obj = new TV();

  obj.ligar();
  obj.desligar();

  obj = new Celular();

  obj.ligar();
  obj.desligar();
}