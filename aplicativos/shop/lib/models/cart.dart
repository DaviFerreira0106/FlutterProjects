import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/product.dart';
import 'dart:math';

class Cart with ChangeNotifier {
  Map<String, CartItem> _itemsCart = {};

  Map<String, CartItem> get itemsCart => {..._itemsCart};

  int get itemsCartCount => _itemsCart.length;

  double get totalAmount {
    double total = 0.0;

    _itemsCart.forEach(
      (idItemsCart, cartItem) => total += cartItem.price * cartItem.quandity,
    );
    return total;
  }

  void addItemCart(Product product) {
    if (_itemsCart.containsKey(product.id)) {
      _itemsCart.update(
        product.id,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          productId: existingCartItem.productId,
          quandity: existingCartItem.quandity + 1,
          title: existingCartItem.title,
          price: existingCartItem.price,
        ),
      );
    } else {
      _itemsCart.putIfAbsent(
        product.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          productId: product.id,
          quandity: 1,
          title: product.title,
          price: product.price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItemCart(String productId) {
    _itemsCart.remove(productId);
    notifyListeners();
  }

  void removeSingleItemCart(String productId) {
    if (!_itemsCart.containsKey(productId)) {
      return;
    }

    if (_itemsCart[productId]?.quandity == 1) {
      _itemsCart.remove(productId);
    } else {
      _itemsCart.update(
        productId,
        (existemCartItem) => CartItem(
            id: existemCartItem.id,
            productId: existemCartItem.productId,
            quandity: existemCartItem.quandity - 1,
            title: existemCartItem.title,
            price: existemCartItem.price),
      );
    }
    notifyListeners();
  }

  void clear() {
    _itemsCart = {};
    notifyListeners();
  }
}
