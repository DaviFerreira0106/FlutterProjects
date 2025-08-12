import 'dart:async';

import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFirebaseService implements ChatService {
  @override
  Stream<List<ChatMessage>> chatStream() {
    return Stream<List<ChatMessage>>.empty();
  }

  @override
  Future<ChatMessage?> save({
    required String text,
    required ChatUser user,
  }) async {
    final msg = ChatMessage(
      id: '',
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      imageUrl: user.imageUrl,
    );

    final store = FirebaseFirestore.instance;
    final docRef = await store
        .collection('chat')
        .withConverter(fromFirestore: _fromFirestore, toFirestore: _toFirestore)
        .add(msg);

    final doc = await docRef.get();
    return doc.data()!;
  }

  Map<String, dynamic> _toFirestore(ChatMessage msg, SetOptions? options) {
    return {
      'text': msg.text,
      'createdAt': msg.createdAt.toIso8601String(),
      'userId': msg.userId,
      'userName': msg.userName,
      'imageUrl': msg.imageUrl,
    };
  }

  ChatMessage _fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    return ChatMessage(
      id: doc.id,
      text: doc['text'],
      createdAt: doc['createdAt'],
      userId: doc['userId'],
      userName: doc['userName'],
      imageUrl: doc['imageUrl'],
    );
  }
}
