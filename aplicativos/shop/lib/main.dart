import 'package:flutter/material.dart';
import 'package:shop/pages/product_overview_page.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Instância da classe de monitoramento na raiz da aplicação
      create: (context) => ProductList(),// Monitoro a classe com notifylistener
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
        home: ProductOverviewPage(),
        routes: {
          AppRoutes.productDetail: (context) => ProductDetailPage(),
        },
      ),
    );
  }
}
