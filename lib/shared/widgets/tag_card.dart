import 'package:flutter/material.dart';
import 'package:manato_web/features/admin_tag/presentation/data/tag_model.dart';

class TagCard extends StatelessWidget {
  const TagCard({super.key, this.category, this.onTap});
  final TagModel? category;
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
