//Função para filtrar elementos de uma lista independente de seu valor
List<E> filtrar<E>(List<E> lista, bool Function(E) fn) {
  List<E> listaFiltrada = [];
  for (E item in lista) {
    if (fn(item)) {
      listaFiltrada.add(item);
    }
  }
  return listaFiltrada;
}

void main() {
  List<double> notas = [8.8, 5.8, 9.9, 2.5, 5.5, 3.9, 7.7];
  List<String> nomes = ['Davi', 'Mariana', 'Elenita', 'Carlito', 'Laura'];

  bool Function(double) notasBoasFn = (double nota) => nota >= 7.5;
  bool Function(String) nomesGrandesFn = (String nome) => nome.length >= 5;

  List<double> notasBoas = filtrar(notas, notasBoasFn);
  print(notasBoas);
  print(notasBoas.length);
  List<String> nomesGrandes = filtrar(nomes, nomesGrandesFn);
  print(nomesGrandes);
  print(nomesGrandes.length);
}
