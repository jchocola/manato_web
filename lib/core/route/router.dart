import 'package:go_router/go_router.dart';
import 'package:manato_web/features/admin/presentation/pages/admin_page_appshell.dart';
import 'package:manato_web/features/admin/presentation/pages/groups_page.dart';
import 'package:manato_web/features/admin/presentation/pages/tags_page.dart';
import 'package:manato_web/features/admin/presentation/pages/templates_page.dart';
import 'package:manato_web/features/landing/presentation/pages/landing_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LandingPage()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AdminPageAppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/templates',
              builder: (context, state) =>const TemplatesPage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/groups',
              builder: (context, state) => const GroupsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tags',
              builder: (context, state) =>const TagsPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
