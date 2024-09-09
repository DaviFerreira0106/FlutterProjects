main() {
  Map<String, double> notas = {
    "Davi Ferreira": 9.3,
    "Mariana Ferreira": 7.5,
    "Carlito Ferreira": 6.8,
    "Elenita Ferreira": 8.8,
    "Laura Fonseca de Lima": 7.9,
  };

  // Utilizando o for pegando a chave do Map
  for (String nome in notas.keys) {
    print("O nome do aluno é: $nome");
  }

  // Tambem pode obter chave e valor utilizando a chave como indice
  for (String nome in notas.keys) {
    print("O aluno $nome tirou nota ${notas[nome]}");
  }

  // Utilizando o for para pegar os valores do Map
  for (double nota in notas.values) {
    print("A nota do aluno foi: $nota");
  }

  // Utilizando o for para pegar chave e valor do Map
  for (var registro in notas.entries) {
    print("O aluno ${registro.key} tirou a nota ${registro.value}.");
  }
}
