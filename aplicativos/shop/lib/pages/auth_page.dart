import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shop/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 70,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepOrange.shade900,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        color: const Color.fromARGB(57, 0, 0, 0),
                        offset: Offset(8, 8),
                      )
                    ]),
                transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                child: Text(
                  "Minha Loja",
                  style: TextStyle(
                    fontSize: 45,
                    fontFamily: "Anton",
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              AuthForm(),
            ],
          ),
        ),
      ),
    );
  }
}
