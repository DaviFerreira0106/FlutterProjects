import 'package:flutter/material.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/models/order_list.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/order_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OrderList orderList = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Pedidos"),
      ),
      body: ListView.builder(
        itemCount: orderList.itemCount,
        itemBuilder: (context, index) => OrderWidget(
          order: orderList.listCart.elementAt(index),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
