import 'package:flutter/material.dart';
import 'package:meals/page/page_categories_meals.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/page/page_meal_detail.dart';
import 'package:meals/page/page_tabs.dart';
import 'package:meals/page/page_settings.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/settings.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatefulWidget {
  const MealsApp({super.key});

  @override
  MealsAppState createState() {
    return MealsAppState();
  }
}

class MealsAppState extends State<MealsApp> {
  List<Meal> _availableMeal = dummyMeals;
  Settings setttingsState = Settings();

  void _filterMeals(Settings settings) {
    setState(() {
      setttingsState = settings;

      _availableMeal = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegen = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterVegetarian &&
            !filterVegen &&
            !filterLactose &&
            !filterGluten;
      }).toList();
    });
  }

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
          titleTextStyle: TextStyle(
            fontFamily: "Raleway",
            fontSize: 24,
          ),
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
        AppRoutes.pageCategoriesMeals: (context) => PageCategoriesMeals(
              listMeal: _availableMeal,
            ),
        AppRoutes.pageMealDetail: (context) => PageMealDetail(),
        AppRoutes.settings: (context) => PageSettings(
              onChangedFilter: _filterMeals,
              settingsState: setttingsState,
            ),
      },
    );
  }
}
