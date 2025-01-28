import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class PageCategoriesMeals extends StatelessWidget {
  const PageCategoriesMeals({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: Center(
          child: Text(
            "Receitas ${category.title}",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      body: Center(
        child: Text("Receitas por Categorias ${category.id}"),
      ),
    );
  }
}
