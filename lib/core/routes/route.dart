import 'package:fithere/presentation/screens/add_activity/view/add_activity_screen.dart';
import 'package:fithere/presentation/screens/home/view/home_screen.dart';
import 'package:fithere/presentation/screens/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

part 'routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case Routes.addActivity:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AddActivityScreen(),
          settings: settings,
        );
      case Routes.splash:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SplashScreen(),
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
