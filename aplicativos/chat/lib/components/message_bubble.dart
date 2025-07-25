import 'dart:io';

import 'package:flutter/material.dart';
import 'package:chat/core/models/chat_message.dart';

class MessageBubble extends StatelessWidget {
  static const _defaultImage = 'assets/images/avatar.png';
  final ChatMessage message;
  final bool belongsToCurrentUser;

  const MessageBubble({
    super.key,
    required this.message,
    required this.belongsToCurrentUser,
  });

  Widget _showUserImage({required String imageUrl}) {
    final uri = Uri.parse(imageUrl);
    ImageProvider? provider;

    if (uri.path.contains(_defaultImage)) {
      provider = AssetImage(_defaultImage);
    } else if (uri.scheme.contains('http')) {
      provider = NetworkImage(imageUrl.toString());
    } else {
      provider = FileImage(File(imageUrl.toString()));
    }

    return CircleAvatar(
      backgroundImage: provider,
      radius: 24,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: belongsToCurrentUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: belongsToCurrentUser
                    ? Colors.grey[300]
                    : Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: belongsToCurrentUser
                      ? Radius.circular(12)
                      : Radius.circular(0),
                  bottomRight: belongsToCurrentUser
                      ? Radius.circular(0)
                      : Radius.circular(12),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 10,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 8,
              ),
              width: 180,
              child: Column(
                crossAxisAlignment: belongsToCurrentUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    message.userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: belongsToCurrentUser ? Colors.black : Colors.white,
                    ),
                  ),
                  Text(
                    message.text,
                    style: TextStyle(
                      color: belongsToCurrentUser ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: belongsToCurrentUser ? null : 165,
          right: belongsToCurrentUser ? 165 : null,
          child: _showUserImage(imageUrl: message.imageUrl),
        )
      ],
    );
  }
}
