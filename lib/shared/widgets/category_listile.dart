import 'package:flutter/material.dart';
import 'package:manato_web/shared/widgets/custom_select.dart';
import 'package:sizer/sizer.dart';

class TemplateListile extends StatelessWidget {
  const TemplateListile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlhrCmPbw6iL1qMKM_1_kXM4CequV1AlfFzQ&s',
          width: 5.w,
          height: 5.w,
          fit: .cover,
        ),

        title: Text('Template Name'),
        subtitle: Text('ID4234'),
        trailing: PopupMenuButton(
          itemBuilder: (context) => List.generate(
            3,
            (index) => PopupMenuItem(child: Text('Category $index')),
          ),
        ),
      ),
    );
  }
}
