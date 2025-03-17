import 'package:flutter/material.dart';
import 'package:shop/models/product_list.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/components/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  const ProductGrid({
    super.key,
    required this.showFavoriteOnly,
  });

  @override
  Widget build(BuildContext context) {
    final ProductList provider = Provider.of(context);
    final List<Product> loadedProducts =
        showFavoriteOnly ? provider.favoriteItems : provider.items;
    return GridView.builder(
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
    );
  }
}
