import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/components/badge_cart.dart';
import 'package:shop/models/cart.dart';

enum FilterOptions {
  favorite,
  all,
}

class ProductOverviewPage extends StatefulWidget {
  const ProductOverviewPage({super.key});

  @override
  State<ProductOverviewPage> createState() => _ProductOverviewPageState();
}

class _ProductOverviewPageState extends State<ProductOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Loja"),
        leading: PopupMenuButton(
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
            setState(() {
              if (value == FilterOptions.favorite) {
                _showFavoriteOnly = true;
              } else {
                _showFavoriteOnly = false;
              }
            });
          },
        ),
        actions: [
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_rounded,
              ),
            ),
            builder: (context, cart, child) => BadgeCart(
              value: cart.itemsCartCount.toString(),
              child: child!,
            ),
          ),
        ],
      ),
      body: ProductGrid(
        showFavoriteOnly: _showFavoriteOnly,
      ),
    );
  }
}
