import 'package:flutter/material.dart';
import 'package:myapp/screens/dashboard_screen.dart';

import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      //case '/activation':
      //   return MaterialPageRoute(builder: (_) => ActivationCodeScreen());
      // case '/dashboard':
      //   return MaterialPageRoute(builder: (_) => const DashboardScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('no route define for ${settings.name}')),
          ),
        );
    }
  }
}
