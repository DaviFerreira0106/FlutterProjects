import 'package:chat/core/models/chat_notification.dart';
import 'package:flutter/material.dart';

class ChatNotificationService with ChangeNotifier{
  final List<ChatNotification> _items = [];

  List<ChatNotification> get items => [..._items];

  void add({required ChatNotification notification}) {
    _items.add(notification);
    notifyListeners();
  }

  void remove({required int index}) {
    _items.removeAt(index);
    notifyListeners();
  }
}