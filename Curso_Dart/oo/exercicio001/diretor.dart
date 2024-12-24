import './funcionario.dart';

class Diretor extends Funcionario {
  String? _unidade;

  Diretor();

  void set setUnidade(String unidade){
    this._unidade = unidade;
  }

  String get getUnidade {
    return this._unidade!;
  }

  @override
  double calcularBonificacao(){
    return getSalario * 0.3;
  }
}