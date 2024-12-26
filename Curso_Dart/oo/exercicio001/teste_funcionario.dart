import 'diretor.dart';
import 'funcionario.dart';
import 'gerente.dart';

void main(){
  Funcionario objFuncionario = new Funcionario();

  objFuncionario.setNome = "Soraia Fonseca";
  objFuncionario.setCpf = "123.456.789-00";
  objFuncionario.setSalario = 1000;

  print("Nome.........: ${objFuncionario.getNome}");
  print("CPF..........: ${objFuncionario.getCpf}");
  print("Salário......: ${objFuncionario.getSalario}");
  print("Bonoficação..: ${objFuncionario.calcularBonificacao()}");

  objFuncionario = new Gerente();

  objFuncionario.setSalario = 1000;
  print("Bonificação Gerente......: ${objFuncionario.calcularBonificacao()}");

  objFuncionario = new Diretor();

   objFuncionario.setSalario = 1000;
  print("Bonificação Diretor......: ${objFuncionario.calcularBonificacao()}");
}