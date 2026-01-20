import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Ganhar jogo', () {
    Tabuleiro tabuleiro = Tabuleiro(linhas: 4, colunas: 4, qtdDeBombas: 0);

    tabuleiro.campos.elementAt(2).minar();
    tabuleiro.campos.elementAt(10).minar();
    tabuleiro.campos.elementAt(15).minar();

    tabuleiro.campos.elementAt(2).alternarMarcacao();
    tabuleiro.campos.elementAt(10).alternarMarcacao();
    tabuleiro.campos.elementAt(15).alternarMarcacao();

    tabuleiro.campos.elementAt(0).abrir();
    tabuleiro.campos.elementAt(1).abrir();
    tabuleiro.campos.elementAt(3).abrir();
    tabuleiro.campos.elementAt(4).abrir();
    tabuleiro.campos.elementAt(5).abrir();
    tabuleiro.campos.elementAt(6).abrir();
    tabuleiro.campos.elementAt(7).abrir();
    tabuleiro.campos.elementAt(8).abrir();
    tabuleiro.campos.elementAt(9).abrir();
    tabuleiro.campos.elementAt(11).abrir();
    tabuleiro.campos.elementAt(12).abrir();
    tabuleiro.campos.elementAt(13).abrir();
    tabuleiro.campos.elementAt(14).abrir();

    expect(tabuleiro.resolvido, isTrue);
  });

  test('Testar recursividade', () {
    Tabuleiro tabuleiro = Tabuleiro(linhas: 4, colunas: 4, qtdDeBombas: 0);

    tabuleiro.campos.elementAt(0).minar();
    tabuleiro.campos.elementAt(15).minar();

    tabuleiro.campos.elementAt(0).alternarMarcacao();
    tabuleiro.campos.elementAt(15).alternarMarcacao();

    tabuleiro.campos.elementAt(1).abrir();

    expect(tabuleiro.resolvido, isTrue);
  });
}
