import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';

class MapPage extends StatefulWidget {
  final PlaceLocation placesLocation;
  final bool isReadOnly;

  const MapPage(
      {super.key,
      this.placesLocation = const PlaceLocation(
        latitude: 37.4219983,
        longitude: -122.084,
      ),
      this.isReadOnly = false});

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  LatLng? _pickedPosition;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione...'),
        actions: [
          IconButton(
            onPressed: _pickedPosition == null
                ? null
                : () => Navigator.of(context).pop(_pickedPosition),
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.placesLocation.latitude,
            widget.placesLocation.longitude,
          ),
          zoom: 13,
        ),
        onTap: widget.isReadOnly ? null : _selectPosition,
        markers: (_pickedPosition == null && !widget.isReadOnly)
            ? {}
            : {
                Marker(
                  markerId: MarkerId('p1'),
                  position: _pickedPosition ?? widget.placesLocation.toLatLng(),
                ),
              },
      ),
    );
  }
}
