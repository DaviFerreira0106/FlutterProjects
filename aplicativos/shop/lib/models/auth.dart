import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/auth_exceptions.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? _email;
  String? _uid;
  DateTime? _expiteDate;

  bool get isAuth {
    final bool isValid = _expiteDate?.isAfter(DateTime.now()) ?? false;
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
    print(response.body);
    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthExceptions(key: body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['e-mail'];
      _uid = body['localId'];
      _expiteDate = DateTime.now().add(
        Duration(
          seconds: int.parse(body['expiresIn']),
        ),
      );
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
}
