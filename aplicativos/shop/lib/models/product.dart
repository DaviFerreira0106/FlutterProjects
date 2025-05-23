import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/http_exceptions.dart';
import 'package:shop/utils/constants.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void _toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> toggleFavorite({
    required Product product,
    required String token,
    required String uid,
  }) async {
    try {
      _toggleFavorite();

      final response = await http.put(
        Uri.parse(
          "${Constants.favoriteBaseUrl}/$uid/${product.id}.json?auth=$token",
        ),
        body: jsonEncode(product.isFavorite),
      );

      if (response.statusCode >= 400) {
        _toggleFavorite();
        throw HttpExceptions(
          message: "Erro ao atualizar favorito.",
          statusCode: response.statusCode,
        );
      }
    } catch (_) {
      _toggleFavorite();
    }
  }
}
