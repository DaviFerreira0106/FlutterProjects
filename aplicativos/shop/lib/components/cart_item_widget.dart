import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Tem Certeza?"),
            content: Text("Quer remover o produto do carrinho?"),
            actions: [
              TextButton(
                child: Text("Não"),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: Text("Sim"),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        );
      },
      background: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
          left: 10,
          right: 10,
        ),
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => Provider.of<Cart>(
        context,
        listen: false,
      ).removeItemCart(cartItem.productId),
      child: Card(
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text(
                  cartItem.price.toString(),
                ),
              ),
            ),
          ),
          title: Text(cartItem.title),
          subtitle: Text(
            "Total R\$ ${(cartItem.price * cartItem.quandity).toStringAsFixed(2)}",
          ),
          trailing: Text(
            "${cartItem.quandity}x",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
