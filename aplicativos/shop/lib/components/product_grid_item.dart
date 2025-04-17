import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    final Cart cart = Provider.of<Cart>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, product, _) => IconButton(
              onPressed: () => product.toggleFavorite(),
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItemCart(product);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Produto adicionado!"),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    textColor: Colors.red,
                    label: "DESFAZER",
                    onPressed: () {
                      cart.removeSingleItemCart(product.id);
                    },
                  ),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart_rounded),
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            AppRoutes.productDetail,
            arguments: product,
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
