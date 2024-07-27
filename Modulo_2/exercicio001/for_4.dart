main() {
  var notas = [9.8, 8.7, 6.3, 7.7, 4.5];

  //A cada loop a variavel nota recebe o valor da lista notas
  for (var nota in notas) {
    print("O valor da nota é = $nota");
  }

  var coordenadas = [
    [1, 4],
    [9, 5],
    [7, 17],
    [23, 6],
  ];

  for (var coordenada in coordenadas) {  //A variavel coordenada recebe as listas da lista coordenadas
    for (var ponto in coordenada) { //A variavel ponto recebe os valores das listas coordenada
      print("Valor $ponto");
    }
  }
}
