class CartItem {
  final String id;
  final String productId;
  final String title;
  final int quandity;
  final double price;

  const CartItem({
    required this.id,
    required this.productId,
    required this.quandity,
    required this.title,
    required this.price,
  });
}