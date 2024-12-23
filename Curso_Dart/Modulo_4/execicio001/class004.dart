class Data {
  int? dia;
  int? mes;
  int? ano;

  Data.nomeada({this.dia, this.mes, this.ano});
  Data.ultimoDiaAno({this.dia = 31, this.mes = 12, this.ano = 2024});

  String toString(){
    return "$dia/$mes/$ano";
  }
}

void main(){
  Data objData = new Data.nomeada(dia: 3, mes: 6, ano: 1978);

  print(objData);
}