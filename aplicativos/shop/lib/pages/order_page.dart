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
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Pedidos"),
      ),
      body: FutureBuilder(
        future: Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<OrderList>(
              builder: (context, orderList, child) => ListView.builder(
                itemCount: orderList.itemCount,
                itemBuilder: (context, index) => OrderWidget(
                  order: orderList.listCart.elementAt(index),
                ),
              ),
            );
          }
        },
      ),
      drawer: AppDrawer(),
    );
  }
}
