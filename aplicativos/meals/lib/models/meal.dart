enum Complexity {
  simple,
  medium,
  difficult,
}

enum Cost {
  cheap,
  fair,
  expensive,
}

class Meal {
  final String id;
  final List<String> categories;
  final String imageUrl;
  final List<String> steps;
  final String title;
  final List<String> ingredients;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.imageUrl,
    required this.steps,
    required this.title,
    required this.ingredients,
    required this.duration,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isLactoseFree,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

  String get getComplexity {
    switch (complexity) {
      case Complexity.simple:
        return "Simples";
      case Complexity.medium:
        return "Medio";
      case Complexity.difficult:
        return "Difícil";
    }
  }

  String get getCost {
    switch (cost) {
      case Cost.cheap:
        return "Barato";
      case Cost.fair:
        return "Justo";
      case Cost.expensive:
        return "Caro";
    }
  }
}
