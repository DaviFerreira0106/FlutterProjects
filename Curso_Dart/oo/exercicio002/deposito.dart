import './transacao.dart';
import './conta.dart';

class Deposito extends Transacao {

  @override
  void realizarTransacao(Conta conta){
    double novoSaldo = conta.getSaldo + getValor;
    conta.setSaldo = novoSaldo;

    print("Deposito realizado em ${getData}");
    print("Descrição: ${getDescricao}");
    print("Valor: ${getValor}");
  }
}