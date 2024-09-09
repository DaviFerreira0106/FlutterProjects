import '../model/carro.dart';

void main() {
  Carro objCarro = new Carro.velocidadeMax(velocidadeMaxima: 350);

  while (!objCarro.estaNoLimite()) {
    objCarro.acelerar();
    print("A velocidade do automovel é ${objCarro.getVelocidadeAtual} Km/h");
  }

  print(
      "O automovel chegou na velocidade maxima de ${objCarro.getVelocidadeAtual} Km/h!");

  while (objCarro.getVelocidadeAtual > 0) {
    objCarro.frear();
    print("A velocidade do automovel é ${objCarro.getVelocidadeAtual} Km/h");
  }

  objCarro.setVelocidadeAtual = 500;//Por conta da verificação do set o valor será ignorado!
  print("O automovel parou com uma velocidade de ${objCarro.getVelocidadeAtual} Km/h!");
}
