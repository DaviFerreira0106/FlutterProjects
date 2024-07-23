/* 
  Operadores

  - Aritméticos (+, -, *, /, %)
  - Lógicos (&&, ||, ^, !)
  - Atribuição (=, +=, -=, *=, /=, %=)
  - Relacionais (>, >=, <, <=, ==, !=)

*/
main() {
  // Aritméticos
  int n1 = 3;
  print(n1 + 2);
  print(n1 - 2);
  print(n1 * 2);
  print(n1 / 2);
  print(n1 % 2);

  // Lógicos
  bool isCaro = false;
  bool isFragil = true;

  print(isCaro && isFragil);
  print(isFragil || isCaro);
  print(isCaro ^ isFragil);
  print(!isFragil);
  print(!isCaro);

  // Atribuição
  double n2 = 4;
  n2 += 3;
  print(n2);
  n2 -= 2;
  print(n2);
  n2 *= 5;
  print(n2);
  n2 /= 2;
  print(n2);
  n2 %= 2;
  print(n2);

  // Relacionais
  int a = 3;
  int b = 5;
  print(a > b);
  print(a >= 4);
  print(b < a);
  print(b <= 7);
  print(a == b);
  print(b != 3);
}
