import 'package:chat/core/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:chat/components/message_bubble.dart';
import 'package:chat/core/services/auth/auth_service.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthServices().currentUser;

    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().chatStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text('Sem dados. Vamos conversar?'),
          );
        } else {
          final msgs = snapshot.data!;
          return ListView.builder(
            reverse: true,
            itemCount: msgs.length,
            itemBuilder: (context, index) => MessageBubble(
              key: ValueKey(msgs.elementAt(index).id),
              message: msgs.elementAt(index),
              belongsToCurrentUser:
                  currentUser?.id == msgs.elementAt(index).userId,
            ),
          );
        }
      },
    );
  }
}
