import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class PageCategoriesMeals extends StatelessWidget {
  final List<Meal> listMeal;

  const PageCategoriesMeals({
    super.key,
    required this.listMeal,
  });

  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;

    final List<Meal> categoryMeal = listMeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: ListView.builder(
        itemCount: categoryMeal.length,
        itemBuilder: (context, index) {
          return MealItem(meal: categoryMeal.elementAt(index));
        },
      ),
    );
  }
}
