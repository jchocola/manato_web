import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SideMenuBar extends StatelessWidget {
  const SideMenuBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(),
        Divider(),

        Expanded(
          child: Column(
          
            crossAxisAlignment: .center,
            spacing: 2.w,
            children: [
              ElevatedButton(
                onPressed: () {
                  navigationShell.goBranch(0);
                },
                child: Text('Templates'),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  navigationShell.goBranch(1);
                },
                child: Text('Groups'),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  navigationShell.goBranch(2);
                },
                child: Text('Tags'),
              ),
            ],
          ),
        ),

        IconButton(onPressed: () {}, icon:Icon( Icons.login)),
      ],
    );
  }
}
