void main(){
  // 1. Acessando Listas
  const List frutas = ['Maça', 'Banana', 'Pera', 'Caju', 'Uva', 'Melão', 'Melancia', 'Morango', 'Abacaxi', 'Amora', 'Franboesa', 'Pitaia', 'Laranja', 'Kiwi'];
  print(frutas.elementAt(3));
  print(frutas[2]);

  // 2. Explorando funções nas listas
  const List nomes = ['Davi', 'Mariana', 'Carlito', 'Elenita', 'Laura', 'Soraia', 'Leonardo', 'Lucas', 'Gabriel', 'Larissa', 'Vitor'];
  print(nomes[5]);
  print(nomes.runtimeType);
  print(nomes.reversed);
  print(nomes.first);
  print(nomes.hashCode);
  print(nomes.isEmpty);
  print(nomes.isNotEmpty);
  print(nomes.iterator);
  print(nomes.last);
  print(nomes.firstOrNull);
  print(nomes.indexed);

  // 3. Adicionando elementos a lista
  final List cursos = [];
  cursos.add("ADS");
  cursos.addAll(["Eng. Sw","Ciencia da Compu.","Medicina","Nutrição","Fisioterapia","Biologia","Mecânica"]);
  print(cursos);
  cursos[1] = "Outro Curso";// Substitui o valor do indice 1
  print(cursos);

  // 4. Removendo elementos da lista
  final List numeros = [1, 2, 54, 6, 7, 32, 87, 43, 2, 21, 3];
  numeros.remove(2);
  print(numeros);
  numeros.removeAt(4);
  print(numeros);
  numeros.add(2);
  print(numeros);
  numeros.removeWhere((element) => element == 2,);
  print(numeros);
  numeros.removeLast();
  print(numeros);
  numeros.removeRange(1, 3);
  print(numeros);
  numeros.clear();
  print(numeros);
  print(numeros.isEmpty);

  // 5. Adicione 5 elementos na lista
  final List lista1 = [];
  lista1.addAll(["Davi", 1, true, 3.5, "Laura"]);
  print(lista1);

  // 6. Remova todos os numeros 5 da lista
  final List list = [3, 6.4, 90, 5, 32, 5.7, 10, 4.8, 5, "Nome", false];
  list.removeWhere((element) => element == 5,);
  print(list);

  // 7. Adicione 5 elementos individualemente na lista
  final List listOne = [];
  listOne.add(1);
  listOne.add("Davi");
  listOne.add(50);
  listOne.add(true);
  listOne.add("Boa Noite!!!");
  print(listOne);

  listOne[1] = 3;
  print(listOne);

  // 8. Substitua valores na lista em um determinado range
  final List list1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  list1[2] = 5;
  list1[3] = 6;
  list1[4] = 7;
  print(list1);

  // 9. Remova elementos da lista em um determinado range
  final List list2 = [1, 2, 3, 4, 5, 66, 43, 21, 77, 87, 90, 100, 1202];
  list2.removeRange(2, 13);
  print(list2);

  // 10. Adicione uma lista dentro da outra
  List list3 = [1, 2, 3, 4];
  list3.add([5, 6, 7, 8]);
  list3.addAll([[9, 10, 11, 12],[13, 14],[15, 16, 20]]);
  print(list3);
} 