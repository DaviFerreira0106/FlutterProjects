import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/models/chat_user.dart';

class AuthMockServices implements AuthServices {
  static final ChatUser _defaultUser = ChatUser(
    id: '456',
    name: 'Davi',
    email: 'davi@gmail.com',
    imageUrl: 'assets/images/avatar.png',
  );

  static final Map<String, ChatUser> _users = {
    _defaultUser.email: _defaultUser,
  };

  static ChatUser? _currentUser;

  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _updateUser(user: _defaultUser);
  });

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required File? image,
  }) async {
    final newUser = ChatUser(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      imageUrl: image?.path ?? 'assets/images/avatar.png',
    );

    _users.putIfAbsent(email, () => newUser);
    _updateUser(user: newUser);
  }

  @override
  Future<void> login({required String email, required String password}) async {
    _updateUser(user: _users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(user: null);
  }

  static void _updateUser({required ChatUser? user}) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
