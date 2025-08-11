import 'package:flutter/material.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/chat/chat_service.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  NewMessageState createState() => NewMessageState();
}

class NewMessageState extends State<NewMessage> {
  String _message = '';
  final TextEditingController _messageController = TextEditingController();

  Future<void> sendMessage() async {
    final user = AuthServices().currentUser;

    if (user != null) {
      final msg = await ChatService().save(text: _message, user: user);
      print(msg?.id);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Enviar Mensagem'),
              onChanged: (message) => setState(() => _message = message),
              onSubmitted: (_) {
                _message.trim().isNotEmpty ? sendMessage() : null;
              },
            ),
          ),
          IconButton(
            onPressed: _message.trim().isEmpty ? null : sendMessage,
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
