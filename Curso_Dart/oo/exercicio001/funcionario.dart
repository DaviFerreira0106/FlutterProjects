class Funcionario {
  String? _nome;
  String? _cpf;
  double? _salario;

  Funcionario();

  void set setNome(String nome){
    this._nome = nome;
  }

  String get getNome {
    return this._nome!;
  }

  void set setCpf(String cpf){
    this._cpf = cpf;
  }

  String? get getCpf {
    return this._cpf;
  }

  void set setSalario(double salario){
    this._salario = salario;
  }

  double get getSalario {
    return this._salario!;
  }

  double calcularBonificacao() {
    return _salario! * 0.1;
  }
}