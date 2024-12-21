void main(){
  // Lista
  List<String> nomes = ['Davi', 'Laura', 'Mariana', 'Elenita', 'Carlito', 'Soraia', 'Elisa', 'Levi'];

  // Regra de Negócio
  bool Function(String) varFnBool = (String element) => element.length > 5 ? true : false;
  int Function(String) varFnInt = (String element) => element.length < 5 ? 0 : 1;

  // Transformação
  Iterable<bool> matrizVerdade = nomes.map(varFnBool);
  Iterable<int> matriz = nomes.map(varFnInt);

  print(matrizVerdade);
  print(matriz);
}