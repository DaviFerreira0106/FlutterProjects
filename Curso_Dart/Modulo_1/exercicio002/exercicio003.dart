import 'dart:io';

main() {
  const PI = 3.1415;

  stdout.write("Digite o valor do raio: ");

  // O exclamação faz com que se garanta que haverá um valor
  final entradaDoUsuario = stdin.readLineSync()!;
  final raio = double.parse(entradaDoUsuario);

  final area = PI * raio * raio;

  print("A area da circunferência é: $area");
}
