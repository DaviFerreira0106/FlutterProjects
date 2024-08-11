class Data {
  int? dia;
  int? mes;
  int? ano;

  Data.com(this.ano) {
    this.dia = 15;
    this.mes = 8;
  }

  String exibirData() {
    return "$dia/$mes/$ano";
  }

  String toString() {
    return exibirData();
  }
}

void main() {
  print(Data.com(2024));
}
