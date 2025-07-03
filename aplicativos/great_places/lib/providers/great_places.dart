import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/db_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  int get itemCount => _items.length;

  Place itemByIndex(int index) {
    return _items.elementAt(index);
  }

  void addPlaces(String title, File image) {
    final newPlaces = Place(
      id: Random().nextDouble().toString(),
      title: title,
      location: PlaceLocation(longitude: 333, latitude: 3333),
      image: image,
    );

    _items.add(newPlaces);

    DbUtils.insert(
      'places',
      {
        'id': newPlaces.id,
        'title': newPlaces.title,
        'image': newPlaces.image.path,
      },
    );

    notifyListeners();
  }
}
