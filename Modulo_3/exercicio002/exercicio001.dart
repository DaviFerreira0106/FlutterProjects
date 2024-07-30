main() {
  //Variávei em funções #1
  int Function(int, int) soma1 = somaFn;

  print(soma1(
      5, 3)); // Os parametros são passados atraves da variável pela função

  //Função anônima em variavel
  int Function(int, int) soma2 = (x, y) {
    return x + y;
  };

  print(soma2(4, 5));

  int Function([int, int]) soma3 = ([x = 0, y = 0]) {
    return x + y;
  };

  print(soma3(11));
}

int somaFn(int a, int b) {
  return a + b;
}
