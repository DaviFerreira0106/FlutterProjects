import 'dart:io';

import 'package:flutter/material.dart';
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

  void _selectImage(File picker) {
    _imagePicker = picker;
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _imagePicker == null) return;

    Provider.of<GreatPlaces>(context, listen: false).addPlaces(
      _titleController.text,
      _imagePicker!,
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
                      ),
                      SizedBox(height: 10),
                      ImageInput(
                        onSelectImage: _selectImage,
                      ),
                      SizedBox(height: 10),
                      LocationInput(),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _submitForm,
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
              style: ButtonStyle(
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
