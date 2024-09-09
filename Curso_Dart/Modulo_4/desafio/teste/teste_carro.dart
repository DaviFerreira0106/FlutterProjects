import '../modelo/carro.dart';

void main() {
  Carro objCarro = new Carro(velocidadeMaxima: 20);

  // Acelerar veículo
  while (!objCarro.estaNoLimite()) {
    objCarro.acelerar();
    print("A velocidade do carro é ${objCarro.velocidadeAtual} Km/h");
  }

  print(
      "O carro chegou no seu limite com velocidade de ${objCarro.velocidadeAtual}");

  // Frear veículo
  while (objCarro.velocidadeAtual > 0) {
    objCarro.frear();
    print("A velocidade do carro é ${objCarro.velocidadeAtual} Km/h");
  }

  print("O carro parou!");
}
