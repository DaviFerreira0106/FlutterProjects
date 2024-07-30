import 'dart:math';

main() {
  print(numeroRandomico(100));

  imprimirData(12, 6, 2002);
  imprimirData(12, 6);
  imprimirData(12);
  imprimirData();
}

int numeroRandomico([int? maximo]) {
  return Random().nextInt(maximo!);
}

imprimirData([int dia = 1, int mes = 1, int ano = 1970]) {
  print('$dia/$mes/$ano');
}
