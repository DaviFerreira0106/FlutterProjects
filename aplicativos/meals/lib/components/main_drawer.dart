import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem({required IconData icon, required String label}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Vamos Cozinhar?",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: 20),
          _createItem(icon: Icons.restaurant, label: "Refeições"),
          _createItem(icon: Icons.settings, label: "Configurações"),
        ],
      ),
    );
  }
}
