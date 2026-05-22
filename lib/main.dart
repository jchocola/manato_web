import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:manato_web/core/di/di.dart';
import 'package:manato_web/core/route/router.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc_event.dart';
import 'package:manato_web/firebase_options.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/theme/app_theme.dart';

final logger = Logger();
void main() async {
  setPathUrlStrategy();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await DI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => sl<UserBloc>()..add(UserBlocEventLoadUser()),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, screenType) => MaterialApp.router(
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
      ),
    );
  }
}
