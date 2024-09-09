main() {
  imprimirData(ano: 2020, mes: 9, dia: 12);
  imprimirData(mes: 12, dia: 15);
  imprimirData(ano: 2024);
  imprimirData();
}

imprimirData({int dia = 1, int mes = 1, int ano = 1970}) {
  print('$dia/$mes/$ano');
}
