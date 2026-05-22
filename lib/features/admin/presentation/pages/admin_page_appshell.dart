import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:manato_web/features/admin/presentation/pages/side_menu_bar.dart';
import 'package:sizer/sizer.dart';

class AdminPageAppShell extends StatelessWidget {
  const AdminPageAppShell({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
    

      body: Row(
        children: [
          SizedBox(
            width: 12.w ,
            child: SideMenuBar(navigationShell: navigationShell)
          ),
          VerticalDivider(),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }
}
