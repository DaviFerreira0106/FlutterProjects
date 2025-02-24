import 'package:flutter/material.dart';
import 'package:shop/pages/page_provider_example.dart';
import 'package:shop/pages/product_overview_page.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/providers/counter_provider.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      // Instância da classe de monitoramento na raiz da aplicação
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
          AppRoutes.productDetail: (context) => PageProviderExample(),
        },
      ),
    );
  }
}
