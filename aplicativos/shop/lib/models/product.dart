import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/http_exceptions.dart';

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

  Future<void> toggleFavorite(Product product) async {
    final String _baseUrl =
        "https://shop-51472-default-rtdb.firebaseio.com/products";

    isFavorite = !isFavorite;
    notifyListeners();

    final response = await http.patch(Uri.parse("$_baseUrl/${product.id}.json"),
        body: jsonEncode(
          {
            "isfavorite": product.isFavorite,
          },
        ));

    if (response.statusCode >= 400) {
      isFavorite = !isFavorite;
      notifyListeners();
      throw HttpExceptions(
        message: "Erro ao atualizar favorito.",
        statusCode: response.statusCode,
      );
    }
  }
}
