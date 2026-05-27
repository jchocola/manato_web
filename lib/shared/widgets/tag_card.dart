import 'package:flutter/material.dart';
import 'package:manato_web/features/admin_tag/data/tag_model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TagCard extends StatelessWidget {
  const TagCard({
    super.key,
    this.tag,
    this.onTap,
    this.onDeletePressed,
    this.onEditPressed,
  });
  final TagModel? tag;
  final void Function()? onTap;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(tag?.title ?? 'Title'),
        subtitle: Text(tag?.id ?? 'id'),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: ShadButton.ghost(
                child: Text('Edit'),
                leading: Icon(Icons.settings),
                onPressed: onEditPressed,
              ),
            ),
            PopupMenuItem(
              child: ShadButton.ghost(
                child: Text('Delete'),
                leading: Icon(Icons.delete),
                onPressed: onDeletePressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
