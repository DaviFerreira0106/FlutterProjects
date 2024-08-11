class Data {
  //Atributos
  int? dia;
  int? mes;
  int? ano;
}

void main() {
  Data objData = new Data();

  objData.dia = 1;
  objData.mes = 6;
  objData.ano = 2002;

  print("${objData.dia}/${objData.mes}/${objData.ano}");
}
