import 'package:flutter/material.dart';
import 'package:meals/page/page_categories.dart';

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
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
      ),
      home: PageCategories(),
    );
  }
}
