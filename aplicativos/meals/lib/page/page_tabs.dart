import 'package:flutter/material.dart';
import 'package:meals/page/page_categories.dart';
import 'package:meals/page/page_favorites.dart';

class PageTabs extends StatelessWidget {
  const PageTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Vamos Cozinhar?",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.secondary,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categorias",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favoritos",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PageCategories(),
            PageFavorites(),
          ],
        ),
      ),
    );
  }
}
