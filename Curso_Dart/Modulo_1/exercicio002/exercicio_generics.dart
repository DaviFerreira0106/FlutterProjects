void main(){
  // 1. Crie uma lista de string
  const List<String> list1 = ['Davi', 'Laura', 'Mariana', 'Elenita', 'Carlito', 'Adilson', 'Victor', 'Guilherme'];
  print(list1);
  print(list1.reversed);

  // 2. Crie uma lista de int
  const List<int> list2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print(list2.elementAt(4));
  print(list2);
  print(list2.length);

  // 3. Crie uma lista de double
  const List<double> list3 = [2.5, 5.7, 4.2, 9.8, 54.9, 10.0, 6, 7.7, 7.0];
  print(list3.elementAtOrNull(4));

  // 4. Crie uma lista de bool
  const List<bool> list4 = [true, false, false, true, false, false, false, true, false, true, true];
  print(list4[4]);

  // 5. Crie uma lista de lista
  final List<List<dynamic>> list5 = const [[123, 5, 4.3, 32], ['Darci' ,'João', 'Velma', 'Salsicha'], [true, false, false, true]];
  print(list5.elementAt(2));
  print(list5.length);

  // 6. Crie uma lista de map
  final List<Map<String, double>> list6 = 
  const [
    {
    'Gerente': 6000.99,
    'Assitente': 4000.99,
    'Estagiario': 600.50,
    }, 
    {
      'Arroz': 20.99,
      'Feijão': 14.98,
      'Óleo': 9.49,
    }, 
    {
      'Computador': 3000.98,
      'Celular': 2500.99,
      'Mouse': 150.99,
    }, 
  ]; 
  print(list6.first);
  print(list6.indexed);

  // 7. Crie uma lista de set
  const List<Set<int>> list7 = [{123, 432, 55766, 212}, {32, 1, 654, 21}, {5, 342, 21, 65}, {544, 212, 12}, {3, 76, 223}]; 
  print(list7.length);
  print(list7.last);
  print(list7.runtimeType);
  print(list7);

  // 8. Crie um map de string
  final Map<String, String> map1 = {
    'Davi': 'Ferreira',
    'Mariana': 'Souza',
    'Laura': 'Lima',
    'Elenita': 'Conceição',
    'Carlito': 'Silva',
  };

  map1.addAll({'Soraia':'Fonseca', 'Guilherme': 'Silva'});
  print(map1);

  // 9. Crie um map de int
  Map<int,String> map2 = const {
    1 : 'Arroz',
    2: 'Feijão',
    3: 'Macarrão',
    4: 'Alface',
    5: 'Molhe de Tomate',
  };

  print(map2.length);
  print(map2.entries);

  // 10. Crie um map de double
  Map<String, double> map3 = {
    'Computador': 3549.99,
    'Mouse': 150.59,
    'Teclado': 260.99,
    'Monitor': 890.90,
    'Notebook': 3699.99,
  };

  map3.addAll({'Gabinete': 499.98});
  print(map3);

  // 11. Crie um map de bool
  final Map<String, bool> map4 = {
    'Caderno': true,
    'Lápis': false,
    'Borracha': false,
    'Caneta': true,
    'Mochila': true,
  };

  map4.addAll({'Apostila': false});
  print(map4.keys);
  print(map4.values);
  print(map4.length);
  print(map4.entries);

  // 12. Crie um map de lista
  const Map<int, List<String>> map5 = {
    1: ['Davi', 'Laura', 'Elisa', 'Levi'],
    2: ['Mariana', 'Guilherme', 'Victor', 'Yago'],
    3: ['Elenita', 'Carlito', 'Soraia', 'João'],
    4: ['Maria', 'Joaquim', 'Sebastião', 'Lucas'],
    5: ['Gabriel', 'Miguel', 'Olavo', 'Murillo'],
  };

  print(map5.entries);

  // 13. Crie um map de map
  const Map<int, Map<String, double>> map6 = {
    1: {
      'Davi': 9.8, 
      'Mariana': 7.8,
      'Laura': 9.3,
      'Carlito': 8.7,
      'Elenita': 5.6,
    },
    2: {
      'Levi': 6.8,
      'Elisa': 5.9,
      'Miguel': 2.4,
      'Rafael': 4.4,
      'Gabriel': 7.1,
    },
    3: {
      'Natan': 8.5,
      'Gessica': 4.9,
      'Guilherme': 6.0,
      'Victor': 6.2,
      'Murillo': 8.4,
    },
    4: {
      'Yago': 7.9,
      'Vitor': 4.5,
      'João': 6.8,
      'Gabriel': 3.9,
      'Junior': 5.3, 
    },
    5: {
      'Lucas': 5.7,
      'Leonardo': 8.6,
      'Ana': 4.1,
      'Zelita': 9.0,
      'Roseli': 10.0,
    },
  };

  print(map6.length);
  print(map6);
  print(map6.entries);

  // 14. Crie um map de set
  final Map<Set<int>, Set<String>> map7 = {
    {1, 2, 3, 4}: {'Azul', 'Roxo', 'Lilás'},
    {5, 6, 7, 8}: {'Vermelho', 'Vinho', 'Marrom'},
    {9, 10}: {'Amarelo', 'Verde', 'Turquesa'},
  };

  map7.addAll({{11, 12, 13}: {'Preto', 'Branco', 'Cinza'}});
  print(map7.entries);
  print(map7.isEmpty);
  print(map7.isNotEmpty);
  print(map7.hashCode);
  print(map7.runtimeType);

  // 15. Crie um set de string
  final Set<String> set1 = {'Davi', 'Luis', 'Julia', 'Larissa', 'Ana', 'Rebeca', 'Nathalia'};
  set1.add('João');
  set1.addAll({'Yago', 'Gabriel', ''});
  print(set1.first);
  print(set1.last);
  print(set1.length);
  print(set1.iterator);
  print(set1.firstOrNull);
  print(set1.indexed);
  print(set1.lastOrNull);
  print(set1.singleOrNull);
  print(set1.nonNulls);
  print(set1);

  // 16. Crie um set de int
  final Set<int> set2 = const {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  print(set2.indexed);
  print(set2);

  // 17. Crie um set de double
  final Set<double> set3 = {9.6 ,3.2, 65.8, 3.7, 9.0, 32.1};
  print(set3);

  // 18. Crie um set de bool
  const Set<bool> set4 = {true, false};
  print(set4);

  // 19. Crie um set de lista
  const Set<List<int>> set5 = {[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11], [11, 12, 13]};
  print(set5);

  // 20. Crie um set de map
  final Set<Map<int, String>> set6 = {
    {1: 'Davi',2: 'Laura',3: 'Mariana',}, 
    {4: 'Carlito',5: 'Elenita',6: 'Larissa',}, 
    {1: 'Gilson',2: 'Paulo',3: 'Wilson',}
    };

  set6.add({4: 'Davi2', 5: 'Davi3'});
  print(set6);

  // 21. Crie um set de set
  const Set<Set<int>> set7 = {{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10}};
  print(set7);
}