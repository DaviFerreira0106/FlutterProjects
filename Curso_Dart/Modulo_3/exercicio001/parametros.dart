main(){
  data();
  data(12);
  data(12,12);
  data(12,12,2012);

  dataNomeada();
  dataNomeada(ano: 2024);
  dataNomeada(dia: 12);
  dataNomeada(mes: 12);
  dataNomeada(ano: 1996, dia: 15, mes: 12);
}

data([int dia = 1, int mes = 1, int ano = 1970]){
  print("$dia/$mes/$ano");
}

dataNomeada({int dia = 1, int mes = 1, int ano = 1970}){
  print("$dia/$mes/$ano");
}