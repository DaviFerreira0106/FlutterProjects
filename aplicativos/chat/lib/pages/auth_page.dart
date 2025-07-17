import 'package:flutter/material.dart';
import 'package:chat/components/auth_form.dart';
import 'package:chat/models/auth_form_data.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  void _handleSubmited(AuthFormData formData) {
    setState(() => _isLoading = true);

    print('email...');
    print(formData.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: <Widget>[
          Center(
            child: SingleChildScrollView(
              child: AuthForm(
                onSubmited: _handleSubmited,
              ),
            ),
          ),
          if (_isLoading)
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
