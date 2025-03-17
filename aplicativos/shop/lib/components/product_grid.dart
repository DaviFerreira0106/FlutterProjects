import 'package:flutter/material.dart';
import 'package:shop/models/product_list.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/components/product_item.dart';

enum FilterOptions {
  favorite,
  all,
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList provider = Provider.of(context);
    final List<Product> loadedProducts = provider.items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Loja"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: FilterOptions.favorite,
                child: Text("Somente Favoritos"),
              ),
              PopupMenuItem(
                value: FilterOptions.all,
                child: Text("Todos"),
              ),
            ],
            onSelected: (FilterOptions value) {
              if (value == FilterOptions.favorite) {
                provider.showFavoriteOnly();
              } else {
                provider.showAll();
              }
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: loadedProducts.elementAt(index),
          child: ProductItem(),
        ),
        itemCount: loadedProducts.length,
      ),
    );
  }
}
