import 'package:flutter/material.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/models/order_list.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/order_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({
    super.key,
  });

  @override
  OrderPageState createState() {
    return OrderPageState();
  }
}

class OrderPageState extends State<OrderPage> {
  bool _isLoadind = true;

  @override
  void initState() {
    super.initState();
    Provider.of<OrderList>(
      context,
      listen: false,
    ).loadOrders().then((_) => setState(() => _isLoadind = false));
  }

  @override
  Widget build(BuildContext context) {
    final OrderList orderList = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Pedidos"),
      ),
      body: _isLoadind
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: orderList.itemCount,
              itemBuilder: (context, index) => OrderWidget(
                order: orderList.listCart.elementAt(index),
              ),
            ),
      drawer: AppDrawer(),
    );
  }
}
