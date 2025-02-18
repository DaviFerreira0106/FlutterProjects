import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

void main() {
  runApp(CriptografadorApp());
}

class CriptografadorApp extends StatelessWidget {
  const CriptografadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  

  //Implementação de criptografia
  final keys = encrypt.Key.fromUtf8("MYKEY");
  final iv = encrypt.IV.fromLength(16);

  final encrypter = encrypt.Encrypted(encrypt.AES(keys));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Criptografador")),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 280,
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Texto a ser Criptografado"),
              ),
            ),
          ),
          Center(
            child: Text(""),
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Criptografar"),
                ),
              ),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Descriptografar"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
