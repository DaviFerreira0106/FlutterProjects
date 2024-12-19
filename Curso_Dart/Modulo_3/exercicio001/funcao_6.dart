import 'dart:math';

void main(){
  // Chamada de funções com parametros
  soma(3, 7);
  subtracao(4, 17);
  multiplicacao(90, 38);
  divisao(5, 8);
  restoDivisao(7, 3);

  // Chamada de funções sem parametros
  somaQualquer();
  subtracaoQualquer();
  multiplicacaoQualquer();
  divisaoQualquer();

  // Chamada de funções com retorno e parametros
  print(somaComRetorno(5, 7));
  print(subtracaoComRetorno(7, 19));
  print(multiplicacaoComRetorno(79, 4));
  print(divisaoComRetorno(4, 8));

  // Chamada de funções sem retorno e parametros
  somaSemRetorno(40, 20);
  subtracaoSemRetorno(17, 8);
  multiplicacaoSemRetorno(7, 2);
  divisaoSemRetorno(56, 100);
  retoSemRetorno(2, 4);
}

// Funções com parametro
soma(int a, int b){
  print("Números selecionados: $a e $b");
  print(a + b);
}

subtracao(double a, int b){
  print("Números selecionados: $a e $b");
  print(a - b);
}

multiplicacao(double a, double b){
  print("Números selecionados: $a e $b");
  print(a + b);
}

divisao(int a, double b){
  print("Números selecionados: $a e $b");
  print(a / b);
}

restoDivisao(int a, int b){
  print("Números selecionados: $a e $b");
  print(a % b);
}

// Funções sem parametros
somaQualquer(){
  int a = Random().nextInt(11);
  int b = Random().nextInt(11);

  print("Números selecionados: $a e $b");
  print("Soma = ${a + b}");
}

subtracaoQualquer(){
  int a = Random().nextInt(11);
  int b = Random().nextInt(11);

  print("Números selecionados: $a e $b");
  print("Subtração = ${a - b}");
}

multiplicacaoQualquer(){
  int a = Random().nextInt(11);
  int b = Random().nextInt(11);

  print("Numeros selecionados: $a e $b");
  print("Multiplicação = ${a * b}");
}

divisaoQualquer(){
  int a = Random().nextInt(11);
  int b = Random().nextInt(11);

  print("Números selecionados: $a e $b");
  print("Divisão = ${a / b}");
}

// Funções com retorno e paramentros
int somaComRetorno(int a, int b){
  return a + b;
}

int subtracaoComRetorno(int a, int b){
  return a - b;
}

int multiplicacaoComRetorno(int a, int b){
  return a * b;
}

double divisaoComRetorno(int a, int b){
  return a / b;
}

// Funções sem retorno e parametro
somaSemRetorno(int a, int b){
  soma(a, b);
}

subtracaoSemRetorno(double a, int b){
  subtracao(a, b);
}

multiplicacaoSemRetorno(double a, double b){
  multiplicacao(a, b);
}

divisaoSemRetorno(int a, double b){
  divisao(a, b);
}

retoSemRetorno(int a, int b){
  restoDivisao(a, b);
}