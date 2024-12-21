import 'dart:math';

void main(){
  // Lista
  List<Map<String, dynamic>> produtos = [
    {'nome': 'Arroz', 'valor': 20.98},
    {'nome': 'Feijão', 'valor': 14.98},
    {'nome': 'Óleo', 'valor': 9.48},
    {'nome': 'Macarrão', 'valor': 4.98},
    {'nome': 'Salada', 'valor': 3.78},
    {'nome': 'Presunto', 'valor': 6.98},
  ];

  // Regra de Negócio
  double Function(Map<String, dynamic>) varFnDouble = (Map<String, dynamic> element) => element['valor'];
  String Function(Map<String, dynamic>) varFnString = (Map<String, dynamic> element) => element['nome'];
  bool Function(Map<String, dynamic>) varFnBool = (Map<String, dynamic> element) => element['valor'] > 10 ? true : false;
  int Function(Map<String, dynamic>) varFnInt = (Map<String, dynamic> element) => element['nome'] = Random().nextInt(11);

  Iterable<double> valores = produtos.map(varFnDouble);
  Iterable<String> nomesProd = produtos.map(varFnString);
  Iterable<bool> trueFalse = produtos.map(varFnBool);
  Iterable<int> codigoProd = produtos.map(varFnInt);

  print(valores);
  print(nomesProd);
  print(trueFalse);
  print(codigoProd);
}