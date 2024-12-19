void main(){
  // Ecercício 1
  const List<List<int>> list = [
    [1, 4, 19],
    [9, 6, 43],
    [0, 10, 61],
    [14, 67, 32],
  ];

  for(List sublist in list){
    for(int value in sublist){
      print('Valor = $value');
    }
  }

  // Exercício 2
  final List<List<String>> list1 = const [
    ['Davi', 'Mariana', 'Laura'],
    ['Carlito', 'Elenita', 'Soraia'],
    ['Guilherme', 'Vitor', 'Yago'],
    ['João', 'Gabriel', 'Elisa'],
  ];

  for(List<String> sublist in list1){
    for(String name in sublist){
      print('Nome = $name');
    }
  }

  // Exercício 3
  const List<List<double>> list3 = [
    [3.5, 4.2, 8.5],
    [1.4, 3.8, 7.4],
    [0.5, 0.3, 12.3],
    [19.4, 23.7, 12.43],
  ];

  for(List<double> sublist in list3){
    for(double value in sublist){
      print("Volor do indice ${list3.indexOf(sublist)} = $value");
    }
  }

  // Exercício 4
  const List<List<bool>> list4 = [
    [true, false, false, true],
    [false, false, false, true],
    [true, true, false, true],
    [false, false, false, false],
  ];

  for(List<bool> sublist in list4){
    for(bool value in sublist){
      print("Valor da ${list4.indexOf(sublist) + 1}ª lista = $value");
    }
  }

  // Exercício 5
  const List<List<Set<dynamic>>> list5 = [
    [{'Computador', 'Mouse', 'Teclado'}, {'Monitor', 'Gabinete', 'Processador'}, {'Modem', 'Fio', 'Cabos'}],
    [{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}, {13, 14, 15, 16}],
    [{'Arroz', 'Feijão', 'Macarrão'}, {'Alho', 'Sal', 'Açucar'}, {'Alface', 'Alecrim', 'Espinafre'}, {'true', 'false'}]
  ];

  for(List<Set<dynamic>> sublist in list5){
    for(Set<dynamic> set in sublist){
      for(dynamic value in set){
        print("Valor contido na ${list5.indexOf(sublist) + 1}ª lista do ${sublist.indexOf(set) + 1}º set = $value");
      }
    }
  }

  // Exercicio 6
  const List<List<Map<String, double>>> list6 = [
    [{
      'Davi': 9.4,
      'Laura': 7.5,
      'Mariana': 8.1,
    }, {
      'Rafael': 9.3,
      'Levi': 4.6,
      'Jhonatas': 6.3,
    }, {
      'Miguel': 3.5,
      'Jose': 1.4,
      'Maria': 5.2,
    }],
    [{
      'Henrique': 9.2,
      'Elias': 7.3,
      'Carlito': 4.8,
    }, {
      'Edite': 8.3,
      'Mario': 10.0,
      'Reinaldo': 6.2,
    }, {
      'Larissa': 7.4,
      'Giovana': 8.0,
      'Xandi': 2.6,
    }],
    [{
      'Aquiles': 4.2,
      'Heitor': 7.2,
      'Zeus': 5.1,
    }, {
      'Alexandre': 9.4,
      'Leonardo': 8.2,
      'Lucas': 4.9,
    }, {
      'Zelita': 7.5,
      'Carlos': 9.1,
      'Matheus': 5.7,
    }],
  ];

  for(List<Map<String, double>> sublist in list6){
    for(Map<String, double> map in sublist){
      for(String key in map.keys){
        print("Chave contida na ${list6.indexOf(sublist) + 1}ª lista do ${sublist.indexOf(map) + 1}º map = ${key}");
      }
      for(double nota in map.values){
        print("Valor contido na ${list6.indexOf(sublist) + 1}ª lista no ${sublist.indexOf(map) + 1}º map = ${nota}");
      }
    }
  }

  for(String i = '#'; i != '#######'; i += '#'){
    print(i);
  }
}