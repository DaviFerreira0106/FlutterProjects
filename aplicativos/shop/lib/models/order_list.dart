import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order.dart';

class OrderList with ChangeNotifier {
  List<Order> _listCart = [];

  List<Order> get listCart => [..._listCart];

  int get itemCount => _listCart.length;

  void addOrder(Cart cart) {
    _listCart.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        products: cart.itemsCart.values.toList(),
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
