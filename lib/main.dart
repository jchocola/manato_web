import 'package:flutter/material.dart';
import 'package:manato_web/core/route/router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/theme/app_theme.dart';

void main() {
   setPathUrlStrategy();
   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
       builder: (context, orientation, screenType) =>
       MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Manato',
        theme: AppTheme.lightTheme,
        routerConfig: router,
        builder: (context, child) {
          return ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: const [
              Breakpoint(start: 0, end: 600, name: MOBILE),
              Breakpoint(start: 601, end: 1024, name: TABLET),
              Breakpoint(start: 1025, end: 1920, name: DESKTOP),
            ],
          );
        },
      ),
    );
  }
}
