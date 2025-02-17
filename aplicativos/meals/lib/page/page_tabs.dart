import 'package:flutter/material.dart';
import 'package:meals/page/page_categories.dart';
import 'package:meals/page/page_favorites.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';

class PageTabs extends StatefulWidget {
  final List<Meal> listMeals;

  const PageTabs({super.key, required this.listMeals});

  @override
  PageTabsState createState() {
    return PageTabsState();
  }
}

class PageTabsState extends State<PageTabs> {
  int _indexScreen = 0;
  late List<Map<String, Object>> _screens;

  @override
  void initState(){
    super.initState();
    _screens = [
    {
      "title": "Categorias",
      "screen": PageCategories(),
    },
    {
      "title": "Meus Favoritos",
      "screen": PageFavorites(listMeal: widget.listMeals),
    },
  ];
  }

  _selectScreen(int index) {
    setState(() {
      _indexScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens.elementAt(_indexScreen)["title"] as String,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      drawer: MainDrawer(),
      body: _screens.elementAt(_indexScreen)["screen"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _indexScreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categoria",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favoritos",
          ),
        ],
      ),
    );
  }
}
