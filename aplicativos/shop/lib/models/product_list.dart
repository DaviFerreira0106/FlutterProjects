import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/http_exceptions.dart';
import 'package:shop/utils/constants.dart';

class ProductList with ChangeNotifier {
  final String _token;
  final String _uid;
  List<Product> _items;

  ProductList([this._token = '', this._uid = '', this._items = const []]);

  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadProducts() async {
    _items.clear();
    final response = await http.get(
      Uri.parse(
        "${Constants.productBaseUrl}.json?auth=$_token",
      ),
    );
    if (response.body == 'null') return;

    final responseFav = await http.get(
      Uri.parse('${Constants.favoriteBaseUrl}/$_uid.json?auth=$_token'),
    );

    Map<String, dynamic> favData =
        responseFav.body == 'null' ? {} : jsonDecode(responseFav.body);

    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach((productId, productData) {
      final isFavorite = favData[productId] ?? false;
      _items.add(
        Product(
          id: productId,
          title: productData['name'],
          description: productData['description'],
          price: productData['price'],
          imageUrl: productData['imageUrl'],
          isFavorite: isFavorite,
        ),
      );
      notifyListeners();
    });
  }

  Future<void> addProduct({required Product product}) async {
    final response = await http.post(
      Uri.parse("${Constants.productBaseUrl}.json?auth=$_token"),
      body: jsonEncode(
        {
          "name": product.title,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
        },
      ),
    );
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
  }

  Future<void> updateProduct({required Product product}) async {
    final int index = _items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      await http.patch(
        Uri.parse(
            "${Constants.productBaseUrl}/${product.id}.json?auth=$_token"),
        body: jsonEncode(
          {
            "name": product.title,
            "description": product.description,
            "price": product.price,
            "imageUrl": product.imageUrl,
          },
        ),
      );

      _items[index] = product;
    }
    notifyListeners();

    return Future.value();
  }

  Future<void> removeProduct({required Product product}) async {
    final int index = _items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      // Remoção Local primeiro!
      final product = _items.elementAt(index);
      _items.remove(product);
      notifyListeners();

      final response = await http.delete(
        Uri.parse(
            "${Constants.productBaseUrl}/${product.id}.json?auth=$_token"),
      );

      if (response.statusCode >= 400) {
        _items.insert(index, product);
        notifyListeners();
        throw HttpExceptions(
          message: "Não foi possível remover o produto.",
          statusCode: response.statusCode,
        );
      }
    }
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
