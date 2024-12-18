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

  // 9. Crie um map de int

  // 10. Crie um map de double

  // 11. Crie um map de bool

  // 12. Crie um map de lista

  // 13. Crie um map de map

  // 14. Crie um map de set

  // 15. Crie um set de string

  // 16. Crie um set de int

  // 17. Crie um set de double

  // 18. Crie um set de bool

  // 19. Crie um set de lista

  // 20. Crie um set de map

  // 21. Crie um set de set
}