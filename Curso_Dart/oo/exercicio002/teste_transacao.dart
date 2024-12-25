import './conta.dart';
import './saque.dart';
import './deposito.dart';

void main(){
  Conta objConta = new Conta();

  objConta.setNumero = 12345;

  Deposito objDeposito = new Deposito();
  objDeposito.setData = "24/12/2024";
  objDeposito.setDescricao = "Deposito bancário";
  objDeposito.setValor = 1000;

  Saque objSaque = new Saque();
  objSaque.setData = "24/12/2024";
  objSaque.setDescricao = "Saque bancário";
  objSaque.setValor = 100;

  objConta.setTransacoes = objDeposito;
  objConta.setTransacoes = objSaque;

  print(objConta.getSaldo);
}