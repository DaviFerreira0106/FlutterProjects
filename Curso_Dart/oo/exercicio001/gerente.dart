import './funcionario.dart';

class Gerente extends Funcionario {
  String? _setor;

  Gerente();

  void set setSetor(String setor){
    this._setor = setor;
  }

  String get getSetor {
    return this._setor!;
  }

  @override
  double calcularBonificacao(){
    return getSalario * 0.2;
  }
}