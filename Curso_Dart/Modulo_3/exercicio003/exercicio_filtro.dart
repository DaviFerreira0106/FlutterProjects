void main(){
  List<int> lista = [1, 2, 4, 67, 43, 78, 12, 9, 03, 90, 105, 128];

  // Regra de negocio (Condição)
  bool Function(int) numPar = (int x) => x % 2 == 0;
  bool Function(int) numImpar = (int x) => x % 3 == 0;

  // Filtragem
  Iterable<int> listaPar = lista.where(numPar);
  Iterable<int> listaImpar = lista.where(numImpar);

  print(listaPar);
  print(listaImpar);
  print(lista.length);

  List<double> lista2 = [2.3, 6.3, 7.1, 4.8, 2.9, 9.2, 4.5, 10.0, 3.4, 5.3];

  bool Function(double) numMaiores5 = (double x) => x > 5;

  Iterable<double> listaFiltrada = lista2.where(numMaiores5);

  print(listaFiltrada);

  List<String> lista3 = ['Davi', 'Mariana', 'Laura', 'Carlito', 'Elenita', 'Soraia', 'Levi', 'Elisa'];

  bool Function(String) selecaoDeNome = (String x) => x.contains('E');

  Iterable<String> listaFiltrada2 = lista3.where(selecaoDeNome);

  print(listaFiltrada2);

  List<bool>  lista4 = [true, false, true, true, false, false, false, true, false];

  bool Function(bool) selecaoTrueFalse = (bool x) => x == true;

  Iterable<bool> listaFiltrada3 = lista4.where(selecaoTrueFalse);

  print(listaFiltrada3.length);
}