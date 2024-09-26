import 'package:diva/core/routing/routes.dart';
import 'package:diva/features/login/ui/login_screen.dart';
import 'package:diva/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../features/splashScreen/ui/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      default:
        return null;
    }
  }
}
