import 'package:chat/core/models/chat_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatNotificationService with ChangeNotifier {
  final List<ChatNotification> _items = [];

  List<ChatNotification> get items => [..._items];

  int get itemCount => _items.length;

  void add({required ChatNotification notification}) {
    _items.add(notification);
    notifyListeners();
  }

  void remove({required int index}) {
    _items.removeAt(index);
    notifyListeners();
  }

  Future<void> init() async {
    await _configureTerminated();
    await _configureForeground();
    await _configureBackground();
  }

  Future<bool> get _isAuthorized async {
    final messageing = FirebaseMessaging.instance;
    final setting = await messageing.requestPermission();

    return setting.authorizationStatus == AuthorizationStatus.authorized;
  }

  Future<void> _configureTerminated() async {
    if (await _isAuthorized) {
      RemoteMessage? initialMsg =
          await FirebaseMessaging.instance.getInitialMessage();
      _handlerMessaging(initialMsg);
    }
  }

  Future<void> _configureBackground() async {
    if (await _isAuthorized) {
      FirebaseMessaging.onMessageOpenedApp.listen(_handlerMessaging);
    }
  }

  Future<void> _configureForeground() async {
    if (await _isAuthorized) {
      FirebaseMessaging.onMessage.listen(_handlerMessaging);
    }
  }

  void _handlerMessaging(RemoteMessage? msg) {
    if (msg == null || msg.notification == null) return;
    add(
      notification: ChatNotification(
        title: msg.notification!.title ?? 'Não Informado!',
        body: msg.notification!.body ?? 'Não Informado!',
      ),
    );
  }
}
