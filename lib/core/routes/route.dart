import 'package:fithere/presentation/screens/home/view/home_screen.dart';
import 'package:flutter/material.dart';

part 'routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final route = _routes[settings.name];
    if (route != null) {
      return MaterialPageRoute<dynamic>(
        builder: route,
        settings: settings,
      );
    }
    return MaterialPageRoute<dynamic>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
      settings: settings,
    );
  }
}
