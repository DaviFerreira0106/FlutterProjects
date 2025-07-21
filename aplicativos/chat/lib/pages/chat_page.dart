import 'package:flutter/material.dart';
import 'package:chat/core/services/auth/auth_mock_services.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Chat Page'),
            TextButton(
              onPressed: AuthMockServices().logout,
              child: Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
