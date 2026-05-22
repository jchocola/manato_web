import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc_state.dart';
import 'package:manato_web/features/admin/presentation/pages/side_menu_bar.dart';
import 'package:manato_web/features/admin/presentation/widgets/sign_in_first_widget.dart';
import 'package:sizer/sizer.dart';

class AdminPageAppShell extends StatelessWidget {
  const AdminPageAppShell({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserBlocState>(
        builder: (context, state) {
          if (state is UserBlocStateAuthenticated) {
            return Row(
              children: [
                SizedBox(
                  width: 12.w,
                  child: SideMenuBar(navigationShell: navigationShell),
                ),
                VerticalDivider(),
                Expanded(child: navigationShell),
              ],
            );
          } else {
            return Center(
              child: SignInFirstWidget(),
            );
          }
        },
      ),
    );
  }
}
