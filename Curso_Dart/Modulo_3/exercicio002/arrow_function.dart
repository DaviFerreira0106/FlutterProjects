void main(){
  // Funções Arrow
  int Function(int, int) adicao = (int x, int y) => x + y;
  int Function(int, int) subtracao = (int x, int y) => x - y;
  double Function(double, double) multiplicacao = (double x, double y) => x * y;
  double Function(double, double) divisao = (double x, double y) => x / y;

  print(adicao(3, 6));
  print(subtracao(4, 3));
  print(multiplicacao(3.8, 4.7)); // 17.86
  print(divisao(2.7, 6.18)); // 0.43

  String Function(String, String) concatenar = (String nome, String sobrenome) => "Seu nome é $nome com sobrenome $sobrenome ";
  String Function(String) nome = (String nome) => "Nome: $nome";

  print(concatenar('Davi', 'Ferreira'));
  print(nome('Laura'));

  bool Function(int, int) testeVerdade = (int x, int y) => x > y;
  bool Function(double, double) testeVerdade2 = (double x, double y) => x < y;
  bool Function(int, int) testeVerdade3 = (int x, int y) => x == y;
  bool Function(double, double) testeVerdade4 = (double x, double y) => x != y;

  print(testeVerdade(2, 6)); //false
  print(testeVerdade2(9, 18)); //true
  print(testeVerdade3(6, 3)); //false
  print(testeVerdade4(94, 94));//false
}