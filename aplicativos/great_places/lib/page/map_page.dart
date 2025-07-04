import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';

class MapPage extends StatefulWidget {
  final PlaceLocation placesLocation;

  const MapPage({
    super.key,
    this.placesLocation = const PlaceLocation(
      latitude: 37.419857,
      longitude: -122.078827,
    ),
  });

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione...'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.placesLocation.latitude,
            widget.placesLocation.longitude,
          ),
          zoom: 13,
        ),
      ),
    );
  }
}
