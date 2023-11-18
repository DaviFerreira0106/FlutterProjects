// Tela de Login
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/backgroundImage.jpeg",
                ),
                alignment: Alignment.topCenter,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 250,
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(62),
                        topRight: Radius.circular(62),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Bem vindo",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                        const Text(
                          "Entre com seu e-mail e senha",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 60),
                        const TextField(
                          decoration: InputDecoration(
                            hintText: "E-mail de usuario",
                            suffixIcon: Icon(Icons.email),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 16,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Senha",
                              suffixIcon: Icon(Icons.remove_red_eye),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("ENTRAR"),
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            elevation: 20,
                            minimumSize: const Size.fromHeight(60),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("Esqueci minha senha"),
                          ),
                        ),
                        const Center(
                          child: Text("Entrar com"),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Tab(
                              icon: Image.asset("assets/images/logoFace.png"),
                              height: 50,
                            ),
                            Tab(
                              icon: Image.asset("assets/images/logoGoogle.png"),
                              height: 50,
                            ),
                            Tab(
                              icon: Image.asset(
                                  "assets/images/logoInstagram.webp"),
                              height: 50,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 180,
            left: 32,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Cadastre-se',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: const StadiumBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
