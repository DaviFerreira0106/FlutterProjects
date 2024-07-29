import 'dart:math';

main() {
  int nota = Random().nextInt(11);

  print('A nota selecionada foi $nota');

  switch (nota) {
    case 10:
    case 9:
    case 8:
    case 7:
      print('Quadro de Honra!');
      print('Parabens!');
      break;
    case 6:
    case 5:
    case 4:
      print('Recuperação');
      break;
    case 3:
    case 2:
    case 1:
    case 0:
      print('Reprovado!');
      break;
    default:
      print('Nota Inválida');
  }
}
