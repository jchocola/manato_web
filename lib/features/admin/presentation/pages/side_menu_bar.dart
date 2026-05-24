import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc_event.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class SideMenuBar extends StatelessWidget {
  const SideMenuBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        ShadAvatar('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlhrCmPbw6iL1qMKM_1_kXM4CequV1AlfFzQ&s' , fit: .cover,),
        Divider(),

        Expanded(
          child: Column(
            crossAxisAlignment: .end,

            spacing: 2.w,
            children: [

              ShadButton(
                onPressed: () {
                  navigationShell.goBranch(0);
                },
                child: Text('Templates'),
              ),
              Divider(),
              ShadButton(
                onPressed: () {
                  navigationShell.goBranch(1);
                },
                child: Text('Categories'),
              ),
              Divider(),
              ShadButton(
                onPressed: () {
                  navigationShell.goBranch(2);
                },
                child: Text('Spec. Tags'),
              ),
            ],
          ),
        ),

        ShadButton(
          onPressed: () {
            context.read<UserBloc>().add(UserBlocEventLogOut());
          },
          leading: Icon(Icons.login),
        ),
      ],
    );
  }
}
