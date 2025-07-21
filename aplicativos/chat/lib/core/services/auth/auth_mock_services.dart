import 'dart:io';

import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/models/chat_user.dart';

class AuthMockServices implements AuthServices {
  static Map<String, ChatUser> users = {};

  static ChatUser? _currentUser;

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Stream<ChatUser?> get userChanges {}

  @override
  Future<void> signup(
      {required String name,
      required String email,
      required String password,
      required File image}) async {}

  @override
  Future<void> login({required String email, required String password}) async {}

  @override
  Future<void> logout() async {}
}
