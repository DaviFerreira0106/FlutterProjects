import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/components/meal_item.dart';

class PageFavorites extends StatelessWidget {
  final List<Meal> listMeal;

  const PageFavorites({super.key, required this.listMeal});

  @override
  Widget build(BuildContext context) {
    if (listMeal.isEmpty) {
      return Center(
        child: Text("Nenhuma Refeição Foi Marcada Como Favorita!"),
      );
    } else {
      return ListView.builder(
        itemCount: listMeal.length,
        itemBuilder: (context, index) {
          return MealItem(
            meal: listMeal.elementAt(index),
          );
        },
      );
    }
  }
}
