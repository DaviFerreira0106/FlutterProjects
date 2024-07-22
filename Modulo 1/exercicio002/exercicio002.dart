main() {
  var n1 = 2;
  var n2 = 3.1415;
  var texto = "A soma dos valores é: ";

  print(texto + (n1 + n2).toString());

  print(n1.runtimeType);
  print(n2.runtimeType);
  print(texto.runtimeType);

  print(n1 is int);
  print(n1 is String);
  print(n1 is double);
}
