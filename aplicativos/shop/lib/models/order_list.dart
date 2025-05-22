import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constants.dart';
import 'package:shop/models/cart_item.dart';

class OrderList with ChangeNotifier {
  final String _token;
  List<Order> _listCart = [];

  OrderList(this._token, this._listCart);

  List<Order> get listCart => [..._listCart];

  int get itemCount => _listCart.length;

  Future<void> loadOrders() async {
    final List<Order> list = [];

    final response = await http
        .get(Uri.parse("${Constants.orderBaseUrl}.json?auth=$_token"));
    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach(
      (orderId, orderData) => list.add(
        Order(
          id: orderId,
          total: orderData['total'],
          products: (orderData['products'] as List<dynamic>).map((item) {
            return CartItem(
              id: item['id'],
              productId: item['productId'],
              quandity: item['quandity'],
              title: item['name'],
              price: item['price'],
            );
          }).toList(),
          date: DateTime.parse(orderData['date']),
        ),
      ),
    );

    _listCart = list.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(Cart cart) async {
    final DateTime date = DateTime.now();

    final http.Response response = await http.post(
      Uri.parse("${Constants.orderBaseUrl}.json?auth=$_token"),
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
