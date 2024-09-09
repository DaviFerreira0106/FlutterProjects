main() {
  List<double> notas = [7.8, 6.3, 9.6, 10.0, 5.4, 8.7, 6.9, 7.7, 2.3, 4.6, 5.5];
  List<String> nomes = [
    'Davi',
    'Mariana',
    'Laura',
    'Elenita',
    'Carlito',
    'Soraia'
  ];

  double total = notas.reduce(somar);
  print(total);

  String nomesJuntos = nomes.reduce(juntarNomes);
  print(nomesJuntos);
}

double somar(double? acumulador, double? elemento) {
  print("$acumulador $elemento");
  return acumulador! + elemento!;
}

String juntarNomes(String acumulador, String elemento) {
  return "$acumulador, $elemento";
}
