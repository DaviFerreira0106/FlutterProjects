class Data {
  // Atributos
  int? dia;
  int? mes;
  int? ano;

  // Metodo
  String exibirData() {
    return "$dia/$mes/$ano";
  }

  String toString() { //Criamos esse metodo pois no print, tudo que é passado que não seja uma string ele converte para String utilizando o toString, o que fizemos foi criar um metodo com mesma sintaxe do toString 
    return exibirData();
  }
}

void main() {
  Data objData = new Data();

  objData.dia = 23;
  objData.mes = 7;
  objData.ano = 2023;

  print(objData.exibirData());
  print(objData);
}
