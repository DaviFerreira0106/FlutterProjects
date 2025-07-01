import 'package:flutter/material.dart';
import 'package:great_places/page/places_list_page.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:great_places/page/places_form_page.dart';

void main() => runApp(GreatPlacesApp());

class GreatPlacesApp extends StatelessWidget {
  const GreatPlacesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.amber,
          seedColor: Colors.indigo,
        ),
      ),
      home: PlacesListPage(),
      routes: {
        AppRoutes.placeForm: (context) => PlacesFormPage(),
      },
    );
  }
}
