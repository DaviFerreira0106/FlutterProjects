import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';

class PageSettings extends StatelessWidget {
  const PageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Configurações",
        ),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Configurações!"),
      ),
    );
  }
}
