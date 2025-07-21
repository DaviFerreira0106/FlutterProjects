import 'dart:io';

import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/auth/auth_mock_services.dart';

abstract class AuthServices {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanges;

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required File? image,
  });

  Future<void> login({required String email, required String password});

  Future<void> logout();

  factory AuthServices() {
    return AuthMockServices();
  }
}
