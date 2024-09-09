void main() {
  List<Map> alunos = [
    {'nome': 'Davi Ferreira', 'nota': 9.3},
    {'nome': 'Mariana Ferreira', 'nota': 8.7},
    {'nome': 'Elenita Ferreira', 'nota': 7.4},
    {'nome': 'Carlito Conceição', 'nota': 8.1},
    {'nome': 'Laura Fonsceca', 'nota': 6.9},
  ];

  String Function(Map) pegarApenasONome = (aluno) => aluno['nome'];
  double Function(Map) pegarApenasAsNotas = (nota) => nota['nota'];

  Iterable<String> nomes = alunos.map(pegarApenasONome);
  Iterable<double> notas = alunos.map(pegarApenasAsNotas);
  print(nomes);
  print(notas);
}
