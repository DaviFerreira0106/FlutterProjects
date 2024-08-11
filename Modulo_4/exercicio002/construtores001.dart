class Data {
  int? dia;
  int? mes;
  int? ano;

  Data(int dia, int mes, int ano) {
    this.dia = dia;
    this.mes = mes;
    this.ano = ano;
  }

  String exibirData() {
    return "$dia/$mes/$ano";
  }

  String toString() {
    return exibirData();
  }
}

void main() {
  Data objData = new Data(1, 6, 2002);

  print(objData);
}
