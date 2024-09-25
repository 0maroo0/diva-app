import 'package:diva/core/routing/app_router.dart';
import 'package:diva/core/routing/routes.dart';
import 'package:diva/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DivaApp extends StatelessWidget {
  final AppRouter appRouter;
  const DivaApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Diva App',
        theme: ThemeData(
          primaryColor: ColorsManager.mainColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
