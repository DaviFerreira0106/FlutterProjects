import 'package:flutter/material.dart';

class PageCategoriesMeals extends StatelessWidget {
  const PageCategoriesMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Receitas"),
        ),
      ),
      body: Center(child: Text("Receitas por Categorias"),),
    );
  }
}
