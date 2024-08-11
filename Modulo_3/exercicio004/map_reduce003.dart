void main() {
  List<Map<String, Object>> alunos = [
    {'nome': 'Davi Ferreira', 'nota': 9.3},
    {'nome': 'Laura Fonsceca', 'nota': 8.5},
    {'nome': 'Mariana Ferreira', 'nota': 6.8},
    {'nome': 'Elenita Ferreira', 'nota': 7.3},
    {'nome': 'Carlito', 'nota': 8.6},
  ];

  double total = alunos
      .map((aluno) => aluno[
          'nota']) //Transformando um lista de Map<String, Object> em uma lista de Object
      .map((nota) =>
          nota as double) //Convertendo os valores da lista para double
      .reduce((double acumulador, double elemento) =>
          acumulador + elemento); //Calculando a somatoria das notas

  Iterable<double> alunosEspeciais = alunos
      .map((aluno) => aluno['nota'])
      .map((nota) => nota as double)
      .where((nota) => nota >= 8); //Metodo que filtrará as melhores notas!

  double totalEspecial =
      alunosEspeciais.reduce((acumulador, elemento) => acumulador + elemento);

  print("A média das notas é: ${total / alunos.length}");
  print("A média dos alunos do quadro de honra é: ${totalEspecial / alunosEspeciais.length}");
}
