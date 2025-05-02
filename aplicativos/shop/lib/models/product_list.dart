import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/data/dummy_data.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  final String _baseUrl = "https://shop-51472-default-rtdb.firebaseio.com";

  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  int get itemsCount {
    return _items.length;
  }

  Future<void> addProduct({required Product product}) {
    final future = http.post(
      Uri.parse("$_baseUrl/products.json"),
      body: jsonEncode(
        {
          "name": product.title,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
          "isfavorite": product.isFavorite,
        },
      ),
    );
    return future.then((response) {
      final String id = jsonDecode(response.body)["name"];
      _items.add(
        Product(
          id: id,
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
        ),
      );
      notifyListeners(); // Notifico os meus interessados
    });
  }

  Future<void> updateProduct({required Product product}) {
    final int index = _items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      _items[index] = product;
    }
    notifyListeners();

    return Future.value();
  }

  void removeProduct({required Product product}) {
    final int index = _items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      _items.removeWhere((prod) => prod.id == product.id);
    }
    notifyListeners();
  }

  Future<void> saveProduct({required Map<String, Object> data}) {
    final bool hasId = data['id'] != null;

    final Product product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      title: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );

    if (hasId) {
      return updateProduct(product: product);
    } else {
      return addProduct(product: product);
    }
  }
}

// Configuração de filtragem de favoritos de forma global!
// bool _showFavoriteOnly = false;

//   // Retorna um clone de items
//   List<Product> get items {
//     if (_showFavoriteOnly == true) {
//       return _items.where((prod) => prod.isFavorite).toList();
//     }
//     return [..._items];
//   }

//   void showFavoriteOnly() {
//     _showFavoriteOnly = true;
//     notifyListeners();
//   }

//   void showAll() {
//     _showFavoriteOnly = false;
//     notifyListeners();
//   }
