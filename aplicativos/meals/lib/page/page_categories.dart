import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/components/category_item.dart';

class PageCategories extends StatelessWidget {
  const PageCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(
          child: Text(
            "Vamos cozinhar?",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyCategories
            .map(
              (category) => CategoryItem(category: category),
            )
            .toList(),
      ),
    );
  }
}
