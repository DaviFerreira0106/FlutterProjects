void main(){
  // Funções em variáveis
  int Function(int, int) soma = somaFn;
  int Function(int, int) subtracao = subFn;
  int Function(int, int) multiplicacao = multFn;
  double Function(int, int) divisao = divFn;

  print(soma(2, 3));
  print(subtracao(5, 1));
  print(multiplicacao(70, 8));
  print(divisao(70, 2));

  // Funções anonimas em variáveis
  int Function(int, int) somaAnonima = (x, y){
    return x + y;
  };

  int Function(int, int) subtracaoAnonima = (x, y){
    return x - y;
  };

  int Function(int, int) multiplicacaoAnonima = (x, y){
    return x * y;
  };

  double Function(int, int) divisaoAnonima = (x, y){
    return x / y;
  };

  print(somaAnonima(3, 70));
  print(subtracaoAnonima(17, 17));
  print(multiplicacaoAnonima(40, 4));
  print(divisaoAnonima(40, 4));
}

// Funções
int somaFn(int a, int b){
  return a + b;
}

int subFn(int a, int b){
  return a - b;
}

int multFn(int a, int b){
  return a * b;
}

double divFn(int a, int b){
  return a / b;
}



