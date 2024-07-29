import 'dart:math';

main() {
  somaDoisNumeros(2, 3);

  int a = 5;
  int b = 10;
  somaDoisNumeros(a, b);

  somaDoisNumerosQuaisquer();
}

void somaDoisNumeros(int a, int b) {
  print(a + b);
}

void somaDoisNumerosQuaisquer() {
  int a = Random().nextInt(11);
  int b = Random().nextInt(11);
  print('Os números selecionados foram: $a e $b');
  print(a + b);
}
