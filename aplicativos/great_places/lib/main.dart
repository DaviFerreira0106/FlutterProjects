import 'package:flutter/material.dart';
import 'package:great_places/page/places_list_page.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:great_places/page/places_form_page.dart';
import 'package:provider/provider.dart';
import 'package:great_places/providers/great_places.dart';

void main() => runApp(GreatPlacesApp());

class GreatPlacesApp extends StatelessWidget {
  const GreatPlacesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            primary: Colors.indigo,
            seedColor: Colors.indigo,
            secondary: Colors.amber,
          ),
        ),
        home: PlacesListPage(),
        routes: {
          AppRoutes.placeForm: (context) => PlacesFormPage(),
        },
      ),
    );
  }
}
