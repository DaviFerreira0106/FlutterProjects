import './transacao.dart';

class Conta {
  int? _numero;
  double? _saldo;
  List<Transacao>? _transacoes = [];

  Conta([this._saldo = 0]);

  void set setNumero(int numero){
    this._numero = numero;
  }

  int get getNumero {
    return this._numero!;
  }

  void set setSaldo(double saldo){
    this._saldo = saldo;
  }

  double get getSaldo {
    return this._saldo!;
  }

  void set setTransacoes(Transacao transacoes){
    this._transacoes!.add(transacoes);
    transacoes.realizarTransacao(this);
  }

  List<Transacao> get getTransacao {
    return this._transacoes!;
  }
}