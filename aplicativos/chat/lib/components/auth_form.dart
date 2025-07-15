import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  AuthFormState createState() => AuthFormState();
}

class AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  label: Text('Nome'),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('E-mail'),
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  label: Text('Senha'),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).buttonTheme.colorScheme?.primary,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text('Criar Conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
