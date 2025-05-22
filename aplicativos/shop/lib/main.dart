import 'package:flutter/material.dart';
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
import 'package:shop/pages/auth_or_home_page.dart';
import 'package:shop/models/auth.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          // Instância da classe de monitoramento na raiz da aplicação
          create: (context) =>
              ProductList('', []), // Monitoro a classe com notifylistener
          update: (context, auth, previous) => ProductList(
            auth.token ?? '',
            previous?.items ?? [],
          ),
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (context) => OrderList('', []),
          update: (context, auth, previous) => OrderList(
            auth.token ?? '',
            previous?.listCart ?? [],
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
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
          AppRoutes.authOrHomePage: (context) => AuthOrHomePage(),
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
