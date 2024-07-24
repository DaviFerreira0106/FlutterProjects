main() {
  // Constantes#2
  final lista = ['Ana', 'Bia', 'Laura', 'Elenita'];
  lista.add(
      'Mariana'); // Embora a variavel seja final, ela pode ter seus valores alterados
  print(lista);

  final lista2 = const ['Banana', 'Maça', 'Laranja'];
  // lista2.add('Mexirica'); quando os valores são const, não se pode alterar os valores
  print(lista2);

  const lista3 = ['Ferro', 'Prego', 'Martelo'];
  // lista3.add('Parafuso'); quando a list é const, não se pode alterar seus valores
  print(lista3);
}
