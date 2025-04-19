import 'package:flutter/material.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/models/product_list.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/utils/app_routes.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciar Produtos"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.productForm),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: products.itemsCount,
        itemBuilder: (context, index) => Column(
          children: [
            ProductItem(
              product: products.items.elementAt(index),
            ),
            Divider(
              color: const Color.fromARGB(255, 189, 189, 189),
            ),
          ],
        ),
      ),
    );
  }
}
