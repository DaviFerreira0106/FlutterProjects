import 'dart:io';

main() {
  // Calculo da área

  const double PI = 3.1415;

  stdout.write("Digite o valor do raio: ");
  final String resposta = stdin.readLineSync()!;
  final double raio = double.parse(resposta); 

  final area = PI * raio * raio;

  print(area);
}