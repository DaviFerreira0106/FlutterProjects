import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class PageMealDetail extends StatelessWidget {
  const PageMealDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(meal.title),
        ),
      ),
      body: Center(
        child: Text("mail Detail"),
      ),
    );
  }
}
