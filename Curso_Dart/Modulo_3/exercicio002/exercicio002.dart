main() {
  //Funções arrow
  int Function(int, int) soma = (p0, p1) => p0 + p1;
  int Function(int, int) subtracao = (p0, p1) => p0 - p1;
  int Function(int, int) multiplicacao = (p0, p1) => p0 * p1;
  double Function(int, int) divisao = (p0, p1) => p0 / p1;

  print(soma(5, 5));
  print(subtracao(10, 5));
  print(multiplicacao(2, 2));
  print(divisao(8, 2));
}
