import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:great_places/utils/location_util.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  LocationInputState createState() => LocationInputState();
}

class LocationInputState extends State<LocationInput> {
  String? _locationImageUrl;

  Future<void> getLocationCurrentUser() async {
    final LocationData locData = await Location().getLocation();
    final locationImagePreviewUrl = LocationUtil.generateLocationPreviewImage(
      longitude: locData.longitude!,
      latitude: locData.latitude!,
    );

    setState(() => _locationImageUrl = locationImagePreviewUrl);
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
              onPressed: getLocationCurrentUser,
              label: Text('Localização Atual'),
              icon: Icon(Icons.location_on),
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text('Selecionar no Mapa'),
              icon: Icon(Icons.map),
            ),
          ],
        ),
      ],
    );
  }
}
