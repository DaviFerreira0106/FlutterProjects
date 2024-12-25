import 'conta.dart';

abstract class Transacao {
  // Atributos
  String? _data;
  double? _valor;
  String? _descricao;

  Transacao();

  // Metodos Getter e Setter
  void set setData(String data){
    this._data = data;
  }

  String get getData {
    return this._data!;
  }

  void set setValor(double valor){
    this._valor = valor;
  }

  double get getValor {
    return this._valor!;
  }

  void set setDescricao(String descricao){
    this._descricao = descricao;
  }

  String get getDescricao {
    return this._descricao!;
  }

  void realizarTransacao(Conta conta);
}