import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manato_web/features/admin/presentation/data/models/template_model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class TemplateInfoPage extends StatelessWidget {
  const TemplateInfoPage({super.key, required this.template});
  final TemplateModel template;
  @override
  Widget build(BuildContext context) {
    return ShadSheet(
      constraints: BoxConstraints(maxWidth: 70.w, minWidth: 60.w),
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  template.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    ShadButton.ghost(
                      child: Text('Edit'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(width: 2.w),
                    ShadButton.destructive(
                      child: Text('Close'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 2.w),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: images
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      ShadCard(
                        child:
                            template.thumbnailImageUrl != null &&
                                template.thumbnailImageUrl!.isNotEmpty
                            ? Image.network(
                                template.thumbnailImageUrl!,
                                fit: BoxFit.cover,
                                height: 25.h,
                                width: double.infinity,
                              )
                            : SizedBox(
                                height: 25.h,
                                child: Center(
                                  child: Icon(Icons.image, size: 8.w),
                                ),
                              ),
                      ),
                      SizedBox(height: 1.w),
                      Row(
                        children: [
                          Expanded(
                            child: ShadCard(
                              child:
                                  template.beforeImageUrl != null &&
                                      template.beforeImageUrl!.isNotEmpty
                                  ? Image.network(
                                      template.beforeImageUrl!,
                                      fit: BoxFit.cover,
                                      height: 12.h,
                                    )
                                  : SizedBox(
                                      height: 12.h,
                                      child: Center(
                                        child: Icon(Icons.photo, size: 6.w),
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(width: 1.w),
                          Expanded(
                            child: ShadCard(
                              child:
                                  template.afterImageUrl != null &&
                                      template.afterImageUrl!.isNotEmpty
                                  ? Image.network(
                                      template.afterImageUrl!,
                                      fit: BoxFit.cover,
                                      height: 12.h,
                                    )
                                  : SizedBox(
                                      height: 12.h,
                                      child: Center(
                                        child: Icon(Icons.photo, size: 6.w),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 2.w),

                // Right: details
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        template.subtitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 1.w),
                      Row(
                        children: [
                          Icon(Icons.stars, size: 3.w),
                          SizedBox(width: 1.w),
                          Text('${template.rating}'),
                          SizedBox(width: 3.w),
                          Icon(Icons.remove_red_eye, size: 3.w),
                          SizedBox(width: 1.w),
                          Text('${template.used} uses'),
                        ],
                      ),

                      SizedBox(height: 1.w),

                         Divider(),

                      // Tags
                      Wrap(
                        spacing: 2.w,
                        runSpacing: 1.w,
                        children: template.tags
                            .map((t) => ShadBadge(child: Text(t)))
                            .toList(),
                      ),

                      SizedBox(height: 2.w),

                         Divider(),

                      // Parameters
                      Text(
                        'Parameters',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 1.w),
                      Column(
                        children: template.parameters.entries
                            .map(
                              (e) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [Text(e.key), Text(e.value)],
                              ),
                            )
                            .toList(),
                      ),

                      SizedBox(height: 2.w),

                      Divider(),

                      Text(
                        'Prompt',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 1.w),
                      ShadCard(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(2.w),
                          child: Text(template.prompt),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
