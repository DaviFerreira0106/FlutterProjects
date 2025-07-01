import 'package:flutter/material.dart';

class CustomRoutes<T> extends MaterialPageRoute<T> {
  CustomRoutes({
    required WidgetBuilder build,
    RouteSettings? setting,
  }) : super(builder: build, settings: setting);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // if (settings.name == '/') return child;

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
