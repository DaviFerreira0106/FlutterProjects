import 'package:campo_minado/models/explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({required this.linha, required this.coluna});

  void adicionarVizinho({required Campo vizinho}) {
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    if (deltaColuna == 0 && deltaLinha == 0) {
      return;
    }

    if (deltaColuna <= 1 && deltaLinha <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrir() {
    if (_aberto) {
      return;
    }

    _aberto = true;

    if (_minado) {
      _explodido = true;
      throw ExplosaoException();
    }

    if (vizinhancaSegura) {
      vizinhos.forEach((v) => v.abrir());
    }
  }

  void revelarBomba() {
    if (minado) {
      _aberto = true;
    }
  }

  void minar() {
    _minado = true;
  }

  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  bool get resolvido {
    final marcadoEminado = minado && marcado;
    final seguroEaberto = aberto && !minado;
    return marcadoEminado || seguroEaberto;
  }

  int get qtdMinasNaVizinhanca {
    return vizinhos.where((v) => v.minado).length;
  }

  bool get aberto => _aberto;

  bool get marcado => _marcado;

  bool get explodido => _explodido;

  bool get minado => _minado;

  bool get vizinhancaSegura => vizinhos.every((v) => !v.minado);
}
