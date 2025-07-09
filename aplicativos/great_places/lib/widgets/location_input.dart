import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:great_places/utils/location_util.dart';
import 'package:great_places/page/map_page.dart';

class LocationInput extends StatefulWidget {
  final Function selectPosition;

  const LocationInput({super.key, required this.selectPosition});

  @override
  LocationInputState createState() => LocationInputState();
}

class LocationInputState extends State<LocationInput> {
  String? _locationImageUrl;

  void _previewImage({required double latitude, required double longitude}) {
    final locationImagePreviewUrl = LocationUtil.generateLocationPreviewImage(
      longitude: longitude,
      latitude: latitude,
    );

    setState(() => _locationImageUrl = locationImagePreviewUrl);
  }

  Future<void> _getLocationCurrentUser() async {
    try {
      final locData = await Location().getLocation();
      _previewImage(latitude: locData.latitude!, longitude: locData.longitude!);
      widget.selectPosition(LatLng(locData.latitude!, locData.longitude!));
    } catch (e) {
      return;
    }
  }

  Future<void> _selectOnMap() async {
    final LatLng? selectedPositionMap = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => MapPage(),
      ),
    );

    if (selectedPositionMap == null) return;

    _previewImage(
      latitude: selectedPositionMap.latitude,
      longitude: selectedPositionMap.longitude,
    );

    widget.selectPosition(selectedPositionMap);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _locationImageUrl == null
              ? Text('Nenhuma localização informada!')
              : Image.network(
                  _locationImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getLocationCurrentUser,
              label: Text('Localização Atual'),
              icon: Icon(Icons.location_on),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              label: Text('Selecionar no Mapa'),
              icon: Icon(Icons.map),
            ),
          ],
        ),
      ],
    );
  }
}
