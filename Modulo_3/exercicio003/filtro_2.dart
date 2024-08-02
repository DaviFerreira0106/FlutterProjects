void main() {
  List<double> notas = [
    8.8,
    4.3,
    9.3,
    10,
    5.4,
    7.5,
    8.9,
    1.2,
    4.4,
    6.4,
    7.6,
    3.9,
    9
  ];

  bool Function(double) notasBoasFn = (p0) =>
      p0 >=
      7; //Variavel que recebe uma função e retorna uma função com teste logico

  var notasBoas = notas.where(notasBoasFn);
  print(notasBoas);
  print(notasBoas.length);

  bool Function(double) notasMuitoBoasFn = (p0) => p0 >= 8.8;

  Iterable<double> notasMuitoBoas = notas.where(notasMuitoBoasFn);
  print(notasMuitoBoas);
  print(notasMuitoBoas.length);
}
