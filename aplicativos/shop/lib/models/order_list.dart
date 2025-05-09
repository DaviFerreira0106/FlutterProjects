import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constants.dart';

class OrderList with ChangeNotifier {
  List<Order> _listCart = [];

  List<Order> get listCart => [..._listCart];

  int get itemCount => _listCart.length;

  Future<void> addOrder(Cart cart) async {
    final DateTime date = DateTime.now();

    final http.Response response = await http.post(
      Uri.parse("${Constants.orderBaseUrl}.json"),
      body: jsonEncode({
        "total": cart.totalAmount,
        "date": date.toIso8601String(),
        "products": cart.itemsCart.values
            .map(
              (cartItems) => {
                "id": cartItems.id,
                "productId": cartItems.productId,
                "name": cartItems.title,
                "quandity": cartItems.quandity,
                "price": cartItems.price,
              },
            )
            .toList(),
      }),
    );

    final id = jsonDecode(response.body)["name"];
    _listCart.insert(
      0,
      Order(
        id: id,
        total: cart.totalAmount,
        products: cart.itemsCart.values.toList(),
        date: date,
      ),
    );
    notifyListeners();
  }
}
