import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manato_web/features/admin_category/presentation/pages/create_category_page.dart';
import 'package:manato_web/features/admin_category/presentation/sections/category_section.dart';
import 'package:manato_web/features/admin_category/presentation/sections/uncategoried_templates_section.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category')),
      body: webBody(context),
      floatingActionButton: ShadButton.destructive(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: true,
            context: context,
            builder: (context) => CreateCategoryPage(),
          );
        },
      ),
    );
  }

  Widget webBody(BuildContext context) {
    return Row(
      spacing: 1.w,
      crossAxisAlignment: .start,
      children: [
        Expanded(flex: 2, child: CategorySection()),
        Divider(),
        Expanded(flex: 1, child: UncategoriedTemplatesSection()),
      ],
    );
  }
}
