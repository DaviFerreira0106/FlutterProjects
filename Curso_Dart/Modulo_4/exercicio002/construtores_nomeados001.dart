class Data {
  // Atributos
  int? dia;
  int? mes;
  int? ano;

  // Construtor nomeado
  Data.com(this.dia, this.mes, this.ano);

  String exibirData() {
    return "$dia/$mes/$ano";
  }

  String toString() {
    return exibirData();
  }
}

void main() {
  Data dataAniversario = Data.com(1, 6, 2002);

  print(dataAniversario);
}
