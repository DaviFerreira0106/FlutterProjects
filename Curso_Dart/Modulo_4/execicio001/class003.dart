class Data {
  int? dia;
  int? mes;
  int? ano;

  // Outra forma de construtor
  // Data([dia, mes, ano]){
  //   this.dia = dia;
  //   this.mes = mes;
  //   this.ano = ano;
  // }

  Data([this.dia = 1, this.mes = 1, this.ano = 1970]);

  String obterData(){
    return "$dia/$mes/$ano";
  }

  String toString(){
    return obterData();
  }
}

void main(){
  // Instanciação/Criação de novo objeto
  Data objData = new Data();

  print(new Data());

  objData.dia = 1;
  objData.mes = 6;
  objData.ano = 2002;

  print(objData.obterData());
  print(objData);
}