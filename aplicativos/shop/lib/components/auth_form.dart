import 'package:flutter/material.dart';

enum AuthMode {
  signup,
  login,
}

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  AuthFormState createState() {
    return AuthFormState();
  }
}

class AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _passwordController = TextEditingController();
    final Size deviceSize = MediaQuery.of(context).size;
    AuthMode _authMode = AuthMode.signup;

    Map<String, String> _authForm = {};

    void _submit() {}

    return Container(
      height: 320,
      width: deviceSize.width * 0.75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "E-mail"),
              onSaved: (email) => _authForm["email"] = email ?? "",
              validator: (_email) {
                final String email = _email ?? "";

                if (email.trim().isEmpty || !email.contains("@")) {
                  return "E-mail Inválido";
                }

                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Senha"),
              onSaved: (password) => _authForm["password"] = password ?? "",
              controller: _passwordController,
              obscureText: true,
              validator: (_password) {
                final String password = _password ?? "";

                if (password.isEmpty || password.length < 5) {
                  return "Senha Inválida";
                }

                return null;
              },
            ),
            if (_authMode == AuthMode.signup)
              TextFormField(
                decoration: InputDecoration(labelText: "Confirmar Senha"),
                obscureText: true,
                validator: (_password) {
                  final String password = _password ?? "";

                  if (password != _passwordController.text) {
                    return "Senhas digitadas estão divergente!";
                  }
                },
              ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary),
              child: Text(
                _authMode == AuthMode.login ? "Entrar" : "Cadastrar",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
