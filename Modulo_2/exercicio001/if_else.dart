import 'dart:math';

main() {
  final int nota = Random().nextInt(11); // 11 por conta de ir de 0 a 10 a nota.

  print("Nota selecionada: $nota.");

  if (nota >= 9) {
    print("Quadro de Honra!");
  } else if (nota >= 7) {
    print("Aprovado!");
  } else if (nota >= 5) {
    print("Recuperação!");
  } else if (nota >= 4) {
    print("Recuperação + Trabalho");
  } else {
    print("Reprovado!");
  }
}
