import 'package:go_router/go_router.dart';
import 'package:manato_web/features/admin/presentation/pages/admin_page_appshell.dart';
import 'package:manato_web/features/admin_category/presentation/pages/category_detail_page.dart';
import 'package:manato_web/features/admin_category/presentation/pages/category_page.dart';
import 'package:manato_web/features/admin_tag/presentation/pages/special_tags_page.dart';
import 'package:manato_web/features/admin_templates/presentation/pages/templates_page.dart';
import 'package:manato_web/features/admin_tag/presentation/pages/tag_info_page.dart';
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
              path: '/category',
              builder: (context, state) => const CategoryPage(),
              routes: [
                GoRoute(
                  path: '/category_detail',
                  builder: (context, state) => const CategoryDetailPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tags',
              builder: (context, state) => const SpecialTagsPage(),
              routes: [
                GoRoute(
                  path: '/tag_detail',
                  builder: (context, state) => const TagInfoPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
