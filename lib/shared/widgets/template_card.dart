import 'package:flutter/material.dart';
import 'package:manato_web/features/admin/presentation/data/models/template_model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class TemplateCard extends StatelessWidget {
  const TemplateCard({
    super.key,
    this.onTap,
    this.template,
    this.onCheckBoxChanged,
    this.onDeleteTap,
    this.onEditTap
  });
  final void Function()? onTap;
  final TemplateModel? template;
  final void Function(bool)? onCheckBoxChanged;
  final void Function()? onDeleteTap;
    final void Function()? onEditTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ShadCard(
        padding: EdgeInsets.all(1.w),
        child: Column(
          spacing: 1.w,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.network(
                    template?.thumbnailImageUrl ??
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlhrCmPbw6iL1qMKM_1_kXM4CequV1AlfFzQ&s',
                    width: 15.w,
                    height: 18.w,
                    fit: .contain,
                  ),

                  PopupMenuButton(itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: onEditTap,
                      child: Text('Edit'),
                    ),
                    PopupMenuItem(
                        onTap: onDeleteTap,
                      child: Text('Delete'),
                    
                    ),
                  ], child: Icon(Icons.more_vert_rounded))
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                spacing: 0.5.w,
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        template?.title ?? 'Template Name',
                        style: TextStyle(fontSize: 1.5.w),
                      ),
                      Text(
                        '#${template?.id ?? 'id'}',
                        style: TextStyle(fontSize: 1.w),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      ShadButton.ghost(
                        leading: Icon(Icons.favorite),
                        child: Text('34.65'),
                      ),
                      ShadButton.ghost(
                        leading: Icon(Icons.star),
                        child: Text('34k'),
                      ),
                    ],
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: ShadSwitch(
                      value: template?.visibility ?? false,
                      label: Text(
                        template?.visibility == true ? 'Active' : 'Inactive',
                      ),
                      height: 2.5.h,
                      width: 4.w,
                      onChanged: onCheckBoxChanged,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 1.w,
                      children: List.generate(
                        template?.tags.length ?? 0,
                        (index) =>
                            ShadBadge.outline(child: Text(template!.tags[index])),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
