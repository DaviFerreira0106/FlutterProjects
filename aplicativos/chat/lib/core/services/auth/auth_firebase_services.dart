import 'dart:async';
import 'dart:io';

import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

    // 1. Atualizar imagem do usuário
    final imageUserName = '${credential.user?.uid}.jpg';
    final imageUrl = await _uploadUserImage(image: image, imageName: imageUserName);

    // 2. Atualizar credenciais do usuário
    credential.user?.updateDisplayName(name);
    credential.user?.updatePhotoURL(imageUrl);
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

  Future<String?> _uploadUserImage({required File? image, required String imageName}) async {
    if(image == null) return null;

    final imageRef = FirebaseStorage.instance.ref().child('user_image').child(imageName);

    await imageRef.putFile(image).whenComplete((){});
    return await imageRef.getDownloadURL();
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
