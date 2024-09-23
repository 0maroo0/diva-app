import 'package:diva/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../features/splashScreen/ui/onboard_Screen.dart';


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      default:
        return null;
    }
  }
}
