import 'dart:async';
import 'dart:io';

import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseServices implements AuthServices {
  static ChatUser? _currentUser;

  static final _userStream = Stream<ChatUser?>.multi(
    (controller) async {
      final userChanges = FirebaseAuth.instance.authStateChanges();
      await for (final user in userChanges) {
        _currentUser = user == null ? null : _toChatUser(user: user);
        controller.add(_currentUser);
      }
    },
  );

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
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credential.user == null) return;

    credential.user?.updateDisplayName(name);
    // credential.user?.updatePhotoURL(photoURL);
  }

  @override
  Future<void> login({required String email, required String password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  static ChatUser _toChatUser({required User user}) {
    return ChatUser(
      id: user.uid,
      name: user.displayName ?? user.email!.split('@')[0],
      email: user.email!,
      imageUrl: user.photoURL ?? 'assets/images/avatar.png',
    );
  }
}
