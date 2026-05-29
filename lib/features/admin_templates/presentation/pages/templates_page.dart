import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc_state.dart';
import 'package:manato_web/features/admin_templates/presentation/sections/search_filter_templates_section.dart';
import 'package:manato_web/features/admin_templates/presentation/sections/showed_templates_section.dart';
import 'package:manato_web/features/admin/presentation/widgets/sign_in_first_widget.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class TemplatesPage extends StatelessWidget {
  const TemplatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: buildBodyWeb(context),
     // floatingActionButton: fab(context),
    );
  }

  Widget fab (BuildContext context){
    return ShadButton.destructive(child: Icon(Icons.add),);
  }

  Widget buildBodyWeb(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Column(
        spacing: 1.w,
        children: [
        SearchFilterTemplatesSection(),
        Expanded(child: ShowedTemplatesSection())
        ]),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {


    return AppBar(
    
      title: Text('Templates'),
      actions: [
        Column(
          mainAxisSize: .min,
          children: [
            Text('Actived : 300'),
            Text('Archived : 32')
          ],
        ),
      ],
    );
  }
}
