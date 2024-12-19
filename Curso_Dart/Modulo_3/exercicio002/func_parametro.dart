import 'dart:math';

// Função #1
void executar({Function? fnPar, Function? fnImpar}){
  int sorteado = Random().nextInt(10);
  print("Valor sorteado $sorteado");

  sorteado % 2 == 0 ? fnPar!() : fnImpar!();
}

// Função #2
void contador({int? qtd, Function(String)? fn, String? txt}){
  for(int i = 0; i < qtd!; i++){
    fn!("${txt!} #${i + 1}");
  }
}

main(){
  void Function() varFnPar = () => print('O valor é Par!');
  void Function() varFnImpar = () => print('O valor é ímpar');

  executar(fnImpar: varFnImpar, fnPar: varFnPar);
  contador(qtd: 8, fn: print, txt: 'Muito legal!');
}