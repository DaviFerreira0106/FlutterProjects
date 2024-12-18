import 'dart:io';

void main(){
  // Operadores Ternarios
  stdout.write('O produto é Caro? (s/N): ');
  bool ehCaro = stdin.readLineSync()! == 's' ? true : false; 

  stdout.write('O produto é frágil? (s/N): ');
  bool ehFragil = stdin.readLineSync()! == 's' ? true : false;

  String resp = ehCaro && ehFragil ? 'Entrega com seguro!!!' : 'Entrega padrão';
  stdout.write('Modo de envio: $resp');
}