import '../model/carro.dart';

void main(){
  // Criação de objeto
  Carro objCarro = new Carro();

  for(; objCarro.velocidadeAtual < objCarro.velocidadeMaxima;){
    print(objCarro.acelerar());
  }

  for(; objCarro.velocidadeAtual > 0;){
    print(objCarro.frear());
  }
}