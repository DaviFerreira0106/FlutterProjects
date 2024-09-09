main() {
  List<double> notas = [8.8, 5.1, 7.5, 9.3, 2.1, 6.6, 4.9];
  List<double> notasBoas = [];

  for (double nota in notas) {
    if (nota >= 7) {
      notasBoas.add(nota);
    }
  }

  print(notasBoas);
}
