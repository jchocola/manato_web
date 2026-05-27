import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manato_web/features/admin_category/presentation/pages/create_category_page.dart';
import 'package:manato_web/features/admin_category/presentation/sections/category_section.dart';
import 'package:manato_web/features/admin_tag/presentation/pages/create_tag_page.dart';
import 'package:manato_web/features/admin_tag/presentation/sections/tags_section.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SpecialTagsPage extends StatelessWidget {
  const SpecialTagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Special Tags')),
      body: webBody(context),
      floatingActionButton: ShadButton.destructive(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: true,
            context: context,
            builder: (context) => CreateTagPage(),
          );
        },
      ),
    );
  }

  Widget webBody(BuildContext context) {
    return SingleChildScrollView(child: Column(children: [TagSection()]));
  }
}
