import 'package:flutter/material.dart';
import 'package:manato_web/features/admin/presentation/data/models/template_model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class TemplateCard extends StatelessWidget {
  const TemplateCard({super.key, this.onTap, this.template , this.onCheckBoxChanged});
  final void Function()? onTap;
  final TemplateModel? template;
  final void Function(bool)? onCheckBoxChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ShadCard(
        padding: EdgeInsets.all(1.w),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.network(
                template?.thumbnailImageUrl ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlhrCmPbw6iL1qMKM_1_kXM4CequV1AlfFzQ&s',
                width: 15.w,
                height: 18.w,
                fit: .contain,
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(template?.title ?? 'Template Name'),
                  Text('#${template?.id ?? 'id'}'),
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
                      label: Text('Activity'),
                      height: 2.h,
                      width: 4.w,
                      onChanged: onCheckBoxChanged,
                    ),
                  ),
                  Wrap(
                    spacing: 1.w,
                    children: List.generate(
                      template?.tags.length ?? 0,
                      (index) =>
                          ShadBadge.outline(child: Text(template!.tags[index])),
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
