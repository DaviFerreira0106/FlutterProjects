import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/db_util.dart';
import 'package:great_places/utils/location_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  int get itemCount => _items.length;

  Place itemByIndex(int index) {
    return _items.elementAt(index);
  }

  Future<void> addPlaces(
    String title,
    File image,
    LatLng position,
  ) async {
    final address = await LocationUtil.getAddressFrom(position: position);

    final newPlaces = Place(
      id: Random().nextDouble().toString(),
      title: title,
      location: PlaceLocation(
        longitude: position.longitude,
        latitude: position.latitude,
        address: address,
      ),
      image: image,
    );

    _items.add(newPlaces);

    DbUtils.insert(
      'places',
      {
        'id': newPlaces.id,
        'title': newPlaces.title,
        'image': newPlaces.image.path,
        'latitude': newPlaces.location.latitude,
        'longitude': newPlaces.location.longitude,
        'address': address,
      },
    );

    notifyListeners();
  }

  Future<void> loadPlaces() async {
    final listData = await DbUtils.getData('places');
    _items = listData
        .map(
          (data) => Place(
            id: data['id'],
            title: data['title'],
            location: PlaceLocation(
              longitude: data['longitude'],
              latitude: data['latitude'],
              address: data['address'],
            ),
            image: File(data['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
