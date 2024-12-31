class Questao {
  // Atributos
  String? _texto;

  // Construtores
  Questao({String? texto}){
    setTexto = texto;
  }

  // Getters e Setters
  set setTexto(String? texto){
    _texto = texto;
  }

  String get getTexto {
    return _texto!;
  }
}