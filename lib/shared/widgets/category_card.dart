import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manato_web/features/admin_category/data/category_model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, this.category, this.onTap, this.onDeletePressed, this.onEditPressed});
  final CategoryModel? category;
  final void Function()? onTap;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        
        onTap: onTap,
        leading: Text(category?.iconStr ?? '' , style: TextStyle(fontSize: 2.w),),
        title: Text(category?.title ?? 'Title' ,  style: TextStyle(fontSize: 1.5.w),),
        subtitle: Text(category?.id ?? 'id' ,  style: TextStyle(fontSize: 1.w),),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(child: ShadButton.ghost(child: Text('Edit'),leading: Icon(Icons.settings), onPressed: onEditPressed,)),
             PopupMenuItem(child: ShadButton.ghost(child: Text('Delete'),leading: Icon(Icons.delete), onPressed: onDeletePressed,)),
            ],
        ),
      ),
    );
  }
}
