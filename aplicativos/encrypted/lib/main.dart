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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  //Atributos de controle
  TextEditingController labelText = TextEditingController();
  dynamic keys = "";
  String textEncrypted = "";
  String dataCrypt = "";
  String decrypted = "";

  // Implementação de criptografia
  void encrypted() {
    setState(() {
      keys = encrypt.Key.fromUtf8('698dc19d489c4e4db73e28a713eab07b');
      final iv = encrypt.IV.fromLength(16);

      final encrypter = encrypt.Encrypter(encrypt.AES(keys));

      final encrypted = encrypter.encrypt(labelText.text, iv: iv);
      final ivBase64 = iv.base64;

      textEncrypted = encrypted.base64;

      dataCrypt = "$ivBase64:$textEncrypted";
    });
  }

  //Implementação de descriptografia
  void decrypt(String encrypData) {
    final parts = encrypData.split(":");
    final iv = encrypt.IV.fromBase64(parts[0]);
    final encrypted = encrypt.Encrypted.fromBase64(parts[1]);

    final encrypter = encrypt.Encrypter(encrypt.AES(keys));
    setState(() {
      decrypted =
          "Texto descriptografado: ${encrypter.decrypt(encrypted, iv: iv)}";
    });
  }

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
                controller: labelText,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Texto a ser Criptografado"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                textEncrypted,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                decrypted,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: encrypted,
                  child: Text("Criptografar"),
                ),
              ),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () => decrypt(dataCrypt),
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
