import 'package:flutter/material.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/models/product_list.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciar Produtos"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: products.itemsCount,
        itemBuilder: (context, index) => Text(
          products.items.elementAt(index).title,
        ),
      ),
    );
  }
}
