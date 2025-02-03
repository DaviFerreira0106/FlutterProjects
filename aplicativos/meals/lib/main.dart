import 'package:flutter/material.dart';
import 'package:meals/page/page_categories_meals.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/page/page_meal_detail.dart';
import 'package:meals/page/page_tabs.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineLarge: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.white,
              ),
              headlineMedium: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.white,
              ),
              headlineSmall: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.white,
              ),
              titleLarge: TextStyle(
                fontFamily: 'RobotoCondensed',
              ),
              titleMedium: TextStyle(
                fontFamily: 'RobotoCondensed',
              ),
              titleSmall: TextStyle(
                fontFamily: 'RobotoCondensed',
              ),
            ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          centerTitle: true,
          
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
      ),
      routes: {
        AppRoutes.home: (context) => PageTabs(),
        AppRoutes.pageCategoriesMeals: (context) => PageCategoriesMeals(),
        AppRoutes.pageMealDetail: (context) => PageMealDetail(),
      },
    );
  }
}
