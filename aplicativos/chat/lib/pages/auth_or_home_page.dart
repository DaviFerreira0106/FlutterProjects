import 'package:flutter/material.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/pages/loading_page.dart';
import 'package:chat/pages/auth_page.dart';
import 'package:chat/pages/chat_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:provider/provider.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({super.key});

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
    await Provider.of<ChatNotificationService>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        } else {
          return Scaffold(
            body: StreamBuilder(
              stream: AuthServices().userChanges,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingPage();
                } else {
                  return snapshot.hasData ? ChatPage() : AuthPage();
                }
              },
            ),
          );
        }
      },
    );
  }
}
