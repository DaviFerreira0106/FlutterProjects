import 'package:flutter/material.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:great_places/providers/great_places.dart';

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Lugares'),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(
              AppRoutes.placeForm,
            ),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    builder: (context, greatPlaces, child) =>
                        greatPlaces.itemCount == 0
                            ? child!
                            : ListView.builder(
                                itemCount: greatPlaces.itemCount,
                                itemBuilder: (context, index) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: FileImage(
                                      greatPlaces.itemByIndex(index).image,
                                    ),
                                  ),
                                  title: Text(
                                    greatPlaces.itemByIndex(index).title,
                                  ),
                                  subtitle: Text(
                                    greatPlaces
                                        .itemByIndex(index)
                                        .location
                                        .address!,
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.placeDetail,
                                      arguments: greatPlaces.itemByIndex(index),
                                    );
                                  },
                                ),
                              ),
                    child: Center(
                      child: Text('Nenhum local cadastrado'),
                    ),
                  ),
      ),
    );
  }
}
