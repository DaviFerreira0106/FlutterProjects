class Carro {
  final int velocidadeMaxima = 100;
  int velocidadeAtual = 0;

  int acelerar(){
    return estaNoLimite() == false ? velocidadeAtual += 5 : velocidadeAtual;
  }

  int frear(){
    return velocidadeAtual <= 0 ? velocidadeAtual : velocidadeAtual -= 5; 
  }

  bool estaNoLimite(){
    return velocidadeAtual == velocidadeMaxima ? true : false;
  }
}