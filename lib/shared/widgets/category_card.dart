import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manato_web/features/admin_category/data/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, this.category, this.onTap});
  final CategoryModel? category;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(
      onTap: onTap,
      title: Text(category?.title ?? 'Title'),
      subtitle: Text(category?.id ?? 'id'),
    ));
  }
}
