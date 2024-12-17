/*
  Tipos basicos do DART

  Numerico = (int e double)
  Texto = (String)
  Logico = (bool)
  Todos = (dynamic)
*/

void main(){
  const num n1 = 123;
  const num n2 = 1.34;

  const int n3 = 5;
  const double n4 = 9.0;

  print((n1 * n2) + (n3 * n4));

  const String texto = "Boa noite";
  const String texto2 = "Vamos estudar um pouco mais?";

  print(texto + texto2 + "!!!!!!");

  const bool estaFrio = false;
  const bool estaChovendo = true;

  print(estaFrio || estaChovendo);

  dynamic x = 123;

  print(x.runtimeType);

  x = "123";

  print(x.runtimeType);
}