import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/data/dummy_data.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  // Retorna um clone de items
  List<Product> get items => [..._items];

  void addProduct({required Product product}) {
    _items.add(product);
    notifyListeners(); // Notifico os meus interessados
  }
}