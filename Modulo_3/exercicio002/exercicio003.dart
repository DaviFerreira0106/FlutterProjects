import 'dart:math';

main() {
  //Variáveis que tem seu tipo  como Function sem parametros e que não retornam nada
  void Function() minhaFnPar = () => print('O valor é Par!!!!');
  void Function() minhaFnImpar = () => print('O valor é Impar!!!!');

  executar(fnImpar: minhaFnImpar, fnPar: minhaFnPar);
}

//Função que recebe duas funções como parâmetro de forma posicional e não retorna nada
void executar({Function? fnPar, Function? fnImpar}) {
  int valor = Random().nextInt(10);
  print('O valor sorteado foi $valor');
  valor % 2 == 0
      ? fnPar!()
      : fnImpar!(); //Função ternaria que verifica se o valor é par ou impar e chama a função passada por parâmetro
}
