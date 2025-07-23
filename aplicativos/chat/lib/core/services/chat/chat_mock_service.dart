import 'dart:async';
import 'dart:math';

import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Olá, bom dia!',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Laura',
      imageUrl: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Olá, tera reunião hoje?',
      createdAt: DateTime.now(),
      userId: '456',
      userName: 'Davi',
      imageUrl: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '1',
      text: 'Tera sim, pode ser agora!',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Laura',
      imageUrl: 'assets/images/avatar.png',
    ),
  ];

  static MultiStreamController<List<ChatMessage>>? _controller;

  static final _msgStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> chatStream() {
    return _msgStream;
  }

  @override
  Future<ChatMessage> save(
      {required String text, required ChatUser user}) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      imageUrl: user.imageUrl,
    );
    _msgs.add(newMessage);
    _controller?.add(_msgs);

    return newMessage;
  }
}
