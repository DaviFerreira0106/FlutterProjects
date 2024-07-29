import 'dart:io';

main() {
  var digitado = '';

  while (digitado != 's') {
    stdout.write('Digite algo ou pressione s para sair: ');
    digitado = stdin.readLineSync()!;
  }

  do {
    stdout.write('Digite algo o pressione s para sair: ');
    digitado = stdin.readLineSync()!;
  } while (digitado != 's');

  print('Fim!');
}
