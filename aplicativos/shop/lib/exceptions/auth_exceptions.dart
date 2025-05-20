class AuthExceptions implements Exception {
  final String key;
  AuthExceptions({required this.key});

  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'o endereço de e-mail já está sendo usado por outra conta',
    'OPERATION_NOT_ALLOWED': 'o login por senha está desativado',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'bloqueamos todas as solicitações deste dispositivo devido a atividades incomuns ou multiplas tentativas. Tente mais tarde',
    'EMAIL_NOT_FOUND': 'E-mail não cadastrado.',
    'INVALID_PASSWORD': 'Senha inválida',
    'USER_DISABLED': 'conta desativada',
    'INVALID_LOGIN_CREDENTIALS':
        'Erro na autenticação, e-mail ou senha inválidos.',
  };

  @override
  String toString() {
    // TODO: implement toString
    return errors[key] ?? 'Ocorreu um erro na autenticação.';
  }
}
