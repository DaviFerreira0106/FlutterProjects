class Data {
  int? dia;
  int? mes;
  int? ano;

  // Construtor nomeado com parametros nomeados
  Data.com({this.dia = 1, this.mes = 1, this.ano = 1970});

  String exibirData() {
    return "$dia/$mes/$ano";
  }

  String toString() {
    return exibirData();
  }
}

void main() {
  print(Data.com(dia: 23));
  print(Data.com(mes: 9, dia: 17));
  print(Data.com(mes: 6, ano: 2023, dia: 1));
}
