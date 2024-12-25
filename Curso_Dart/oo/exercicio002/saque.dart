import './conta.dart';
import './transacao.dart';

class Saque extends Transacao {

  @override
  void realizarTransacao(Conta conta) {
    
    double novoSaldo = conta.getSaldo - getValor; 
    conta.setSaldo = novoSaldo;

    print("Saque realizado em ${getData}");
    print("Descrição: ${getDescricao}");
    print("Valor do Saque ${getValor}");
  }
}