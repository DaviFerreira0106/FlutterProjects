import 'dart:math';

main() {
  int resultado = soma(4, 9);
  print("A soma entre 4 e 9 é: $resultado");

  resultado *= resultado;
  print("O dobro da soma entre 4 e 9 é: $resultado");

  print(
      "O resultado da soma de dois números quaisquer foi ${somaDoisNumerosQuaisquer()}");
}

int soma(int a, int b) {
  return a + b;
}

int somaDoisNumerosQuaisquer() {
  int a = Random().nextInt(11);
  int b = Random().nextInt(11);
  print("Os valores selecionados foram: $a e $b");
  return a + b;
}
