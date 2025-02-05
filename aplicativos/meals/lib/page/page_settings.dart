import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class PageSettings extends StatefulWidget {
  const PageSettings({super.key});

  @override
  PageSettingsState createState() {
    return PageSettingsState();
  }
}

class PageSettingsState extends State<PageSettings> {
  Widget _createSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required void Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  final Settings settings = Settings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Configurações",
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                "Configurações",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  title: "Sem Glúten",
                  subtitle: "Só exibe comidas sem glúten ",
                  value: settings.isGlutenFree,
                  onChanged: (value) => setState(
                    () => settings.isGlutenFree = value,
                  ),
                ),
                _createSwitch(
                  title: "Sem Lactose",
                  subtitle: "Só exibe comidas sem lactose",
                  value: settings.isLactoseFree,
                  onChanged: (value) => setState(
                    () => settings.isLactoseFree = value,
                  ),
                ),
                _createSwitch(
                  title: "Vegana",
                  subtitle: "Só exibe comidas veganas",
                  value: settings.isVegan,
                  onChanged: (value) => setState(
                    () => settings.isVegan = value,
                  ),
                ),
                _createSwitch(
                  title: "Vegetariana",
                  subtitle: "Só exibe comidas vegetarianas",
                  value: settings.isVegetarian,
                  onChanged: (value) => setState(
                    () => settings.isVegetarian = value,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
