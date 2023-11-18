// Tela de Login
import 'package:flutter/material.dart';

class AuthScreenSignUp extends StatefulWidget {
  const AuthScreenSignUp({super.key});

  @override
  State<AuthScreenSignUp> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreenSignUp> {
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
                  top: 350,
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
                        const SizedBox(
                          height: 20,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            hintText: "Nome",
                            suffixIcon: Icon(Icons.done_rounded),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 16,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "E-mail ",
                              suffixIcon: Icon(Icons.email),
                            ),
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
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 16,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Confirmar senha",
                              suffixIcon: Icon(Icons.remove_red_eye),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("CADASTRAR"),
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            elevation: 20,
                            minimumSize: const Size.fromHeight(60),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 280,
            left: 32,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Login',
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
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height / 6,
            child: const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 70,
              child: Icon(
                Icons.person_sharp,
                size: 80,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
