import 'package:diva/core/di/dependency_injection.dart';
import 'package:diva/core/routing/routes.dart';
import 'package:diva/features/login/logic/cubit/login_cubit.dart';
import 'package:diva/features/login/ui/login_screen.dart';
import 'package:diva/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:diva/features/sign_up/ui/sign_up_screen.dart';
import 'package:diva/features/verification/ui/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(getIt()),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignUpCubit(getIt()),
            child: const SignUpScreen(),
          ),
        );

      case Routes.verificationScreen:
        return MaterialPageRoute(
          builder: (_) => const VerificationScreen(),
        );
      default:
        return null;
    }
  }
}
