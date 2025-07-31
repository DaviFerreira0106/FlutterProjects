import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat/core/services/notification/chat_notification_service.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChatNotificationService>(context);
    final item = service.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: service.itemCount,
          itemBuilder: (context, index) => ListTile(
            title: Text(item.elementAt(index).title),
            subtitle: Text(item.elementAt(index).body),
            onTap: () => service.remove(index: index),
          ),
        ),
      ),
    );
  }
}
