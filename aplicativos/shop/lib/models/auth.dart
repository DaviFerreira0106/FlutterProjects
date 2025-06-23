import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/auth_exceptions.dart';
import 'package:shop/data/store.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? _email;
  String? _uid;
  DateTime? _expiryDate;
  Timer? _timerLogout;

  bool get isAuth {
    final bool isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get email {
    return isAuth ? _email : null;
  }

  String? get uid {
    return isAuth ? _uid : null;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  Future<void> _authenticate({
    required String email,
    required String password,
    required String urlFragment,
  }) async {
    final String _url =
        "https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyB-Bu7j_ZPlfIpPRPuK-dN9Z6KNgnvsLNk";
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthExceptions(key: body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['e-mail'];
      _uid = body['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(body['expiresIn']),
        ),
      );

      Store.saveMap(key: 'userData', value: {
        'token': _token,
        'email': _email,
        'uid': _uid,
        'expiryDate': _expiryDate!.toIso8601String(),
      });

      _autoLogout();
      notifyListeners();
    }
  }

  Future<void> signup({
    required String email,
    required String password,
  }) async {
    return _authenticate(
        email: email, password: password, urlFragment: 'signUp');
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    return _authenticate(
        email: email, password: password, urlFragment: 'signInWithPassword');
  }

  Future<void> tryAutoLogin() async {
    if (isAuth) return;

    final userData = await Store.getMap(key: 'userData');
    if (userData.isEmpty) return;

    final expiryDate = DateTime.parse(userData['expiryDate']);
    if (expiryDate.isBefore(DateTime.now())) return;

    _token = userData['token'];
    _email = userData['email'];
    _uid = userData['uid'];
    _expiryDate = expiryDate;

    _autoLogout();
    notifyListeners();
  }

  void logout() {
    _token = null;
    _uid = null;
    _email = null;
    _expiryDate = null;
    _clearAutoLogout();
    Store.remove(key: 'userData').then((_) {
      notifyListeners();
    });
  }

  void _clearAutoLogout() {
    _timerLogout?.cancel();
    _timerLogout = null;
  }

  void _autoLogout() {
    _clearAutoLogout();
    final timeExpireDate =
        _expiryDate?.difference(DateTime.now()).inSeconds ?? 0;
    _timerLogout = Timer(Duration(seconds: timeExpireDate), logout);
  }
}
