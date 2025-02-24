// Classe de estado
import 'package:flutter/material.dart';

class CounterPage {
  int _value = 0;

  void inc() => _value++;
  void dec() => _value--;
  int get value => _value;
}

// Classe de monitoramento de estado
class CounterProvider extends InheritedWidget {
  CounterProvider({super.key, required Widget child})
      : super(child: child);

  // Intância da classe de estado
  final CounterPage state = CounterPage();
  
  // Método para acessar a instancia do Counter Provider na aplicação
  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    return true;
  }
}
