import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/data/dummy_data.dart';
import 'dart:math';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  int get itemsCount {
    return _items.length;
  }

  void addProduct({required Product product}) {
    _items.add(product);
    notifyListeners(); // Notifico os meus interessados
  }

  void addProductFromData({required Map<String, Object> data}) {
    final Product newProduct = Product(
      id: Random().nextDouble().toString(),
      title: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );

    addProduct(product: newProduct);
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
