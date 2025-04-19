import 'package:flutter/material.dart';
import 'package:shop/pages/product_overview_page.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/pages/order_page.dart';
import 'package:shop/pages/product_page.dart';
import 'package:shop/pages/product_form_page.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // Instância da classe de monitoramento na raiz da aplicação
          create: (context) =>
              ProductList(), // Monitoro a classe com notifylistener
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderList(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
          ),
          fontFamily: "Lato",
          colorScheme: ColorScheme.light(
            primary: Colors.blueGrey,
            secondary: Colors.red,
          ),
        ),
        routes: {
          AppRoutes.home: (context) => ProductOverviewPage(),
          AppRoutes.productDetail: (context) => ProductDetailPage(),
          AppRoutes.cart: (context) => CartPage(),
          AppRoutes.order: (context) => OrderPage(),
          AppRoutes.products: (context) => ProductPage(),
          AppRoutes.productForm: (context) => ProductFormPage(),
        },
      ),
    );
  }
}
