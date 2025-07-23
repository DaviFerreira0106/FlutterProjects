import 'package:chat/core/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/services/chat/chat_service.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
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
          return ListView.builder(
            reverse: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => Text(
              snapshot.data!.elementAt(index).text,
            ),
          );
        }
      },
    );
  }
}
