// Utilização de encapsulamento no atributo
class Carro {
  final int velocidadeMaxima;
  int _velocidadeAtual = 0; // Atributo privado!

  Carro.velocidadeMax({this.velocidadeMaxima = 200});

  // Método Getter e Setter
  int get getVelocidadeAtual {
    return this._velocidadeAtual;
  }

  void set setVelocidadeAtual(int velocidade) {
    // Verificação de segurança no que será setado no atributo!
    if (_velocidadeAtual + velocidade > velocidadeMaxima) {
      _velocidadeAtual = _velocidadeAtual;
    } else {
      this._velocidadeAtual = velocidade;
    }
  }

  // Metodos
  int acelerar() {
    if (_velocidadeAtual + 5 >= velocidadeMaxima) {
      _velocidadeAtual = velocidadeMaxima;
    } else {
      _velocidadeAtual = _velocidadeAtual + 5;
    }
    return _velocidadeAtual;
  }

  int frear() {
    if (_velocidadeAtual - 5 < 0) {
      _velocidadeAtual = 0;
    } else {
      _velocidadeAtual = _velocidadeAtual - 5;
    }
    return _velocidadeAtual;
  }

  bool estaNoLimite() {
    return _velocidadeAtual == velocidadeMaxima;
  }
}
