main() {
  String Function(String) meuTxt = (String txt) {
    print(txt);
    return txt;
  };
  //No caso o valor int no loop é o 5, a função é o print (interno do dart), e o valor String é o 'Consegui de novo!!!'
  executarAte(5, print, 'Consegui!!!');
  
  print(executarPor(5, meuTxt, 'Consegui de novo!!!!!'));
}

//Função que recebe um valor int e outro string como parametro, e recebe uma função que tem uma String como parametro e não retorna nada
void executarAte(int qtde, Function(String) fn, String valor) {
  //O valor int passado via parametro para a função, servirá para controlar o looping
  for (int i = 0; i < qtde; i++) {
    //O valor String passado para via parametro, será passado como parametro para a função passada via parametro
    fn(valor);
  }
}

//Função que retorna um valor int, recebe como parametro um int, String e uma função que retorna uma String e recebe uma String como parametro 
int executarPor(int qtde, String Function(String) fn, String valor) {
  String texto = '';//Variavel que será utilizada para retornar o valor total da String após o loop
  for (int i = 0; i < qtde; i++) {
    //Se fez necessario a Function retornar uma String, pois assim pode ser usada pela variavel 'texto', onde está acumulando as String
    texto += fn(valor);
  }
  //Se fez necessario a função 'executarPor' retornar int, pois assim retorna o tamanho da variavel texto com o valor acumulado das Strings após o loop
  return texto.length;
}
