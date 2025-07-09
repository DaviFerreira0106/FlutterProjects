import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:provider/provider.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/widgets/location_input.dart';

class PlacesFormPage extends StatefulWidget {
  const PlacesFormPage({super.key});

  @override
  PlacesFormPageState createState() => PlacesFormPageState();
}

class PlacesFormPageState extends State<PlacesFormPage> {
  final TextEditingController _titleController = TextEditingController();
  File? _imagePicker;
  LatLng? _pickedPosition;

  void _selectPosition(LatLng position) {
    setState(() => _pickedPosition = position);
  }

  void _selectImage(File picker) {
    setState(() => _imagePicker = picker);
  }

  bool _isValid() {
    return _titleController.text.isNotEmpty &&
        _imagePicker != null &&
        _pickedPosition != null;
  }

  void _submitForm() {
    if (!_isValid()) return;

    Provider.of<GreatPlaces>(context, listen: false).addPlaces(
      _titleController.text,
      _imagePicker!,
      _pickedPosition!,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Lugar'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          label: Text('Título'),
                        ),
                        onChanged: (text) => setState(() {}),
                      ),
                      SizedBox(height: 10),
                      ImageInput(
                        onSelectImage: _selectImage,
                      ),
                      SizedBox(height: 10),
                      LocationInput(
                        selectPosition: _selectPosition,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: !_isValid() ? null : _submitForm,
              label: Text(
                'Adicionar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              style: !_isValid()
                  ? ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.grey,
                      ),
                    )
                  : ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
