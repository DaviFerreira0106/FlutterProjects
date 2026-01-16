import 'package:campo_minado/models/campo.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Teste da Classe Campo', () {
    test('Abrir campo COM explosão', () {
      Campo c = Campo(linha: 0, coluna: 0);
      c.minar();

      expect(c.abrir, throwsException);
    });

    test('Abrir campo SEM explosão', () {
      Campo c = Campo(linha: 1, coluna: 1);
      c.abrir();

      expect(c.aberto, isTrue);
    });

    test('Adicionar NÃO vizinhos', () {
      Campo c1 = Campo(linha: 0, coluna: 0);
      Campo c2 = Campo(linha: 2, coluna: 2);

      c1.adicionarVizinho(vizinho: c2);

      expect(c1.vizinhos.isEmpty, isTrue);
    });

    test('Adicionar vizinho', () {
      Campo c1 = Campo(linha: 1, coluna: 1);
      Campo c2 = Campo(linha: 0, coluna: 0);

      c1.adicionarVizinho(vizinho: c2);

      expect(c1.vizinhos.length, 1);
    });
  });
}
