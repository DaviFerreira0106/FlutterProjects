import 'package:flutter/material.dart';
import 'package:chat/models/auth_form_data.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  AuthFormState createState() => AuthFormState();
}

class AuthFormState extends State<AuthForm> {
  final _authForm = AuthFormData();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if(!isValid) return;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              if (_authForm.isSignUp)
                TextFormField(
                    key: ValueKey('name'),
                    initialValue: _authForm.name,
                    onChanged: (name) => _authForm.name = name,
                    decoration: InputDecoration(
                      label: Text('Nome'),
                    ),
                    validator: (_name) {
                      final String name = _name ?? '';

                      if (name.trim().length < 5) {
                        return 'O nome precisa ser maior de 5 caracteres.';
                      }

                      return null;
                    }),
              TextFormField(
                  key: ValueKey('email'),
                  initialValue: _authForm.email,
                  onChanged: (email) => _authForm.email = email,
                  decoration: InputDecoration(
                    label: Text('E-mail'),
                  ),
                  validator: (_email) {
                    final String email = _email ?? '';

                    if (!email.contains('@')) {
                      return 'E-mail inválido.';
                    }

                    return null;
                  }),
              TextFormField(
                  key: ValueKey('password'),
                  initialValue: _authForm.password,
                  onChanged: (password) => _authForm.password = password,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text('Senha'),
                  ),
                  validator: (_password) {
                    final String password = _password ?? '';

                    if (password.trim().length < 6) {
                      return 'A senha precisa conter 6 caracteres.';
                    }

                    return null;
                  }),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).buttonTheme.colorScheme?.primary,
                  ),
                ),
                onPressed: _submit,
                child: Text(
                  _authForm.isLogin ? 'Entrar' : 'Cadastrar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  setState(() => _authForm.toggleAuthMode());
                },
                child: Text(
                  _authForm.isLogin ? 'Criar Conta?' : 'Já possui conta?',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
