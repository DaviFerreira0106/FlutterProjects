class Data {
  int? dia;
  int? mes;
  int? ano;

  // Construtor com parametros opcionais e com valores padrão
  Data([this.dia = 1, this.mes = 6, this.ano = 2002]);

  String exibirData() {
    return "$dia/$mes/$ano";
  }

  String toString() {
    return exibirData();
  }
}

void main() {
  Data objData = new Data();

  print(objData);
  print(Data());
  print(Data(17));
  print(Data(17, 5));
  print(Data(17, 5, 2021));
}
