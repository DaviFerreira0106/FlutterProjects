import 'package:flutter/material.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/components/messages.dart';
import 'package:chat/components/new_message.dart';
import 'package:provider/provider.dart';
import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/pages/notification_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
          actions: <Widget>[
            DropdownButtonHideUnderline(
              child: DropdownButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black87,
                ),
                items: [
                  DropdownMenuItem(
                    value: 'logout',
                    child: SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.exit_to_app),
                          SizedBox(width: 10),
                          Text('Sair'),
                        ],
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value == 'logout') {
                    AuthServices().logout();
                  }
                },
              ),
            ),
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.notifications),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.red.shade800,
                    maxRadius: 11,
                    child: Text(
                      '${Provider.of<ChatNotificationService>(context).itemCount}',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Messages(),
              ),
              NewMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
