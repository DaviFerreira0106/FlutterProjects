import 'package:flutter/material.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/pages/loading_page.dart';
import 'package:chat/pages/auth_page.dart';
import 'package:chat/pages/chat_page.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: AuthServices().userChanges,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          } else {
            return snapshot.hasData ? ChatPage() : AuthPage();
          }
        }
      ),
    );
  }
}