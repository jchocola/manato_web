import 'package:go_router/go_router.dart';
import 'package:manato_web/features/landing/presentation/pages/landing_page.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LandingPage()),
    ],
  );
}
