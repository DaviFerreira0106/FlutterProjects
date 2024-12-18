void main(){
  // Entendendo final e const

  // Quando deixamos a variavel list como final, podemos modificar seus valores, oq não podemos é atribuir outra lista a variavel
  final List lista1 = ['Davi', 'Laura', 'Mariana', 'Soraia', 'Carlito', 'Elenita'];
  lista1.add('Elisa');
  lista1.remove('Davi');

  // Podemos deixar os valores da list imutavel declarando a lista como const ou a variavel list como const

  // Exemplo1
  final List lista2 = const ['Banana', 'Maça', 'Pera', 'Caju', 'Pessego', 'Melão', 'Melancia'];
  // lista2.add('Ameixa'); Erro na hora de compilação

  const List lista3 = ['Computador', 'Mouse', 'Teclado', 'Monitor', 'Gabinete'];
  // lista3.add('Modem'); Erro na hora de compilação
}