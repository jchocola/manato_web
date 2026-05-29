import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manato_web/features/admin/presentation/widgets/search_by_group_filter.dart';
import 'package:manato_web/features/admin/presentation/widgets/search_result_info_section.dart';
import 'package:manato_web/features/admin_templates/presentation/sections/template_status_filter_section.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class SearchFilterTemplatesSection extends StatelessWidget {
  const SearchFilterTemplatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      child: Column(
        crossAxisAlignment: .start,
        spacing: 1.w,
        children: [
          Row(
            spacing: 1.w,
            children: [
              Flexible(child: ShadInput(leading: Icon(Icons.search))),
               TemplateStatusFilterSection(),
              ShadButton.destructive(
                child: Icon(Icons.add),
                onPressed: () {
                  context.go('/templates/create_template');
                },
              ),
            ],
          ),
   

          SearchResultInfoSection(),
          SearchByGroupFilter(),
        ],
      ),
    );
  }
}
