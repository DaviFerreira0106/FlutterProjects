import 'dart:math';

import 'package:campo_minado/models/campo.dart';

class Tabuleiro {
  final int linhas;
  final int colunas;
  final int qtdDeBombas;
  final List<Campo> _campos = [];

  Tabuleiro({
    required this.linhas,
    required this.colunas,
    required this.qtdDeBombas,
  }) {
    _criarCampos();
    _relacionarVizinhos();
    _sortearMinas();
  }

  void _criarCampos() {
    for (int l = 0; l < linhas; l++) {
      for (int c = 0; c < colunas; c++) {
        _campos.add(Campo(linha: l, coluna: c));
      }
    }
  }

  void _relacionarVizinhos() {
    for (var campo in _campos) {
      for (var vizinho in _campos) {
        campo.adicionarVizinho(vizinho: vizinho);
      }
    }
  }

  void _sortearMinas() {
    int sorteadas = 0;

    int index = Random().nextInt(_campos.length);

    if (qtdDeBombas > linhas * colunas) {
      return;
    }

    while (sorteadas < qtdDeBombas) {
      if (!_campos.elementAt(index).minado) {
        sorteadas++;
        _campos.elementAt(index).minar();
      }
    }
  }

  void reiniciar() {
    _campos.forEach((c) => c.reiniciar());
    _sortearMinas();
  }

  void revelarBombas() {
    _campos.forEach((c) => c.revelarBomba());
  }

  List<Campo> get campos => _campos;

  bool get resolvido => _campos.every((c) => c.resolvido);
}
