//Função com generics
E? segundoElemento<E>(List<E> lista) {
  return lista.length >= 2 ? lista[1] : null;
}

void main() {
  List<int> lista = [2, 5, 9, 6, 3, 76, 32, 77, 4];

  print(segundoElemento(lista));
}
