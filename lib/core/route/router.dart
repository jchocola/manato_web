import 'package:go_router/go_router.dart';
import 'package:manato_web/features/admin/presentation/pages/admin_page_appshell.dart';
import 'package:manato_web/features/admin/presentation/pages/category_page.dart';
import 'package:manato_web/features/admin/presentation/pages/special_tags_page.dart';
import 'package:manato_web/features/admin/presentation/pages/templates_page.dart';
import 'package:manato_web/features/admin_templates/presentation/pages/create_template_page.dart';
import 'package:manato_web/features/admin_templates/presentation/pages/edit_template_page.dart';
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
              builder: (context, state) => const TemplatesPage(),
              routes: [
                GoRoute(
                  path: '/create_template',
                  builder: (context, state) => const CreateTemplatePage(),
                ),
                GoRoute(
                  path: '/edit_template',
                  builder: (context, state) => const EidtTemplatePage(),
                ),
              ],
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/groups',
              builder: (context, state) => const CategoryPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tags',
              builder: (context, state) => const SpecialTagsPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
