import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc_state.dart';
import 'package:manato_web/features/admin_tag/presentation/blocs/tags_bloc.dart';
import 'package:manato_web/features/admin_templates/presentation/blocs/create_template_bloc.dart';
import 'package:manato_web/main.dart';
import 'package:manato_web/shared/widgets/custom_input.dart';
import 'package:manato_web/shared/widgets/custom_select.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryBloc = context.read<CategoryBloc>();
    final specialTagsBloc = context.read<TagsBloc>();
    return ShadCard(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Settings'),

          Row(
            spacing: 1.w,
            children: [
              // CATEGORY
              Expanded(
                child: CustomSelect(
                  title: 'Category',
                  onChanged: (value) {
                    logger.i('Selected category: $value');
                    context.read<CreateTemplateBloc>().add(
                      CreateTemplateBlocEventSetCategory(categoryId:  value ?? ''),
                    );
                  },
                  options: categoryBloc.state is CategoryBlocStateLoaded
                      ? (categoryBloc.state as CategoryBlocStateLoaded)
                            .categoryList
                            .map((e) => e.id)
                            .toList()
                      : [],
                ),
              ),

              //TEMPLATE ID
              Expanded(
                child: CustomSelect(
                  title: 'Special Tag',
                  onChanged: (value) {
                    logger.i('Selected special tag: $value');
                    context.read<CreateTemplateBloc>().add(
                      CreateTemplateBlocEventSetSpecialTag(specialTagId: value ?? ''),
                    );
                  },
                  options: specialTagsBloc.state is TagsBlocStateLoaded
                      ? (specialTagsBloc.state as TagsBlocStateLoaded).tags
                            .map((e) => e.id)
                            .toList()
                      : [],
                ),
              ),

              //TEMPLATE ID
              Expanded(
                child: CustomSelect(
                  title: 'Stars',
                  onChanged: (value) {
                    logger.i('Selected rating: $value');
                    context.read<CreateTemplateBloc>().add(
                      CreateTemplateBlocEventSetRating(rating: value ?? ''),
                    );
                  },
                  options: ['1', '2', '3', '4', '5'],
                ),
              ),

              Expanded(child: CustomInput(title: 'Used' , controller: context.read<CreateTemplateBloc>().usedCountController,)),
            ],
          ),
        ],
      ),
    );
  }
}
