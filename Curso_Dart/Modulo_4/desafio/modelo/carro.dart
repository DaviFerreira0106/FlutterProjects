class Carro {
  // Atributos
  int? velocidadeMaxima;
  int velocidadeAtual = 0;

  // Construtor
  Carro({int velocidadeMaxima = 200}) {
    this.velocidadeMaxima = velocidadeMaxima;
  }

  // Métodos
  int acelerar() {
    if (velocidadeAtual + 5 >= velocidadeMaxima!) {
      velocidadeAtual = velocidadeMaxima!;
    } else {
      velocidadeAtual = velocidadeAtual + 5;
    }
    return velocidadeAtual;
  }

  int frear() {
    if (velocidadeAtual - 5 <= 0) {
      velocidadeAtual = 0;
    } else {
      velocidadeAtual = velocidadeAtual - 5;
    }
    return velocidadeAtual;
  }

  bool estaNoLimite() {
    return velocidadeAtual == velocidadeMaxima!;
  }
}
