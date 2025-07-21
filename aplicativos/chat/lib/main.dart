import 'package:flutter/material.dart';
import 'package:chat/pages/auth_or_home_page.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          primary: Colors.blue,
        ),
        useMaterial3: true,
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightBlue,
            primary: Colors.blue,
          ),
        ),
      ),
      home: AuthOrHomePage(),
    );
  }
}
