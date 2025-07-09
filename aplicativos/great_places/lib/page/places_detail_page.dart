import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/page/map_page.dart';

class PlacesDetailPage extends StatelessWidget {
  const PlacesDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)?.settings.arguments as Place;
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 240,
            width: double.infinity,
            alignment: Alignment.center,
            child: Image.file(
              alignment: Alignment.center,
              place.image,
              fit: BoxFit.cover,
              height: 240,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${place.location.address}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => MapPage(
                    isReadOnly: true,
                  ),
                ),
              );
            },
            label: Text(
              'Ver no Mapa',
              style: TextStyle(fontSize: 17),
            ),
            icon: Icon(
              Icons.map,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
