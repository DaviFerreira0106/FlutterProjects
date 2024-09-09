/*
  Tipos basicos do DART

  Numerico = (int e double)
  Texto = (String)
  Logico = (bool)
  Todos = (dynamic)
*/

main() {
  int n1 = 3;
  double n2 = 3.1415;
  double n3 = (-5.0)
      .abs(); //O metodo abs() retira o sinal negativo e pega apenas o valor absoluto!
  num n4 = 5.23; // O num recebe tanto numeros inteiros quanto decimais

  print(n1 + n2 + n3 * n4);

  String texto = "Um texto bem legal!";

  print(texto);

  bool estaChovendo = true;
  bool estaFrio = false;

  print(estaChovendo && estaFrio);

  dynamic x = "Outro texto bem legal!!!";

  print(x);

  x = 123;

  print(x);

  x = true;

  print(x);
}
