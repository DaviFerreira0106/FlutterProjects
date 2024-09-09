main() {
  juntar('Bom ', 'dia!!!!');
  juntar(1, 9);
  String frase = juntar('O valor de PI é: ', 3.1415);
  print(frase.toUpperCase());
}

String juntar(dynamic a, b) {
  print("A junção dos valores $a e $b foi: ${a.toString() + b.toString()}");
  return a.toString() + b.toString();
}
