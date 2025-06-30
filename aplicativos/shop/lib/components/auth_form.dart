import 'package:flutter/material.dart';
import 'package:shop/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:shop/exceptions/auth_exceptions.dart';

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

class AuthFormState extends State<AuthForm>
    with SingleTickerProviderStateMixin {
  final TextEditingController _passwordController = TextEditingController();
  AuthMode _authMode = AuthMode.login;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  AnimationController? _controller;
  Animation<double>? _opacityAnimation;
  Animation<Offset>? _slideAnimation;
  Map<String, String> _authForm = {};

  bool _isLogin() => _authMode == AuthMode.login;
  // bool _isSignup() => _authMode == AuthMode.signup;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.linear,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  void _switchMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.signup;
        _controller?.forward();
      } else {
        _authMode = AuthMode.login;
        _controller?.reverse();
      }
    });
  }

  void _showDialogError({required String msg}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Erro de Autenticação'),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    bool _isValid = _formKey.currentState?.validate() ?? false;

    if (!_isValid) {
      return;
    }

    setState(() => _isLoading = true);

    _formKey.currentState?.save();

    final auth = Provider.of<Auth>(context, listen: false);

    try {
      if (_isLogin()) {
        //Login
        await auth.signIn(
          email: _authForm['email']!,
          password: _authForm['password']!,
        );
      } else {
        // Cadastrar
        await auth.signup(
          email: _authForm['email']!,
          password: _authForm['password']!,
        );
      }
    } on AuthExceptions catch (error) {
      _showDialogError(msg: error.toString());
    } catch (error) {
      _showDialogError(msg: 'Ocorreu um erro de autenticação.');
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      height: _isLogin() ? 310 : 400,
      width: deviceSize.width * 0.75,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: const Color.fromARGB(27, 0, 0, 0),
              offset: Offset(8, 8),
            ),
          ]),
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
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
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.linear,
              constraints: BoxConstraints(
                minHeight: _isLogin() ? 0 : 60,
                maxHeight: _isLogin() ? 0 : 120,
              ),
              child: SlideTransition(
                position: _slideAnimation!,
                child: FadeTransition(
                  opacity: _opacityAnimation!,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Confirmar Senha"),
                    obscureText: true,
                    validator: (_password) {
                      final String password = _password ?? "";

                      if (password != _passwordController.text) {
                        return "Senhas digitadas estão divergente!";
                      }

                      return null;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    child: Text(
                      _isLogin() ? "Entrar" : "Cadastrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            Spacer(),
            TextButton(
              onPressed: _switchMode,
              child: Text(
                _isLogin() ? "Cadastrar" : "Entrar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
