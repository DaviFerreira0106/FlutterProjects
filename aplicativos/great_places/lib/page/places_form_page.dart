import 'package:flutter/material.dart';

class PlacesFormPage extends StatefulWidget {
  const PlacesFormPage({super.key});

  @override
  PlacesFormPageState createState() => PlacesFormPageState();
}

class PlacesFormPageState extends State<PlacesFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Lugar'),
      ),
      body: Center(
        child: Text('Form!!!!!!!!!'),
      ),
    );
  }
}
