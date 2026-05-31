import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manato_web/core/enum/templates_view_state.dart';
import 'package:manato_web/features/admin_templates/presentation/blocs/templates_bloc.dart';
import 'package:manato_web/features/admin_templates/presentation/pages/edit_template_page.dart';
import 'package:manato_web/features/admin_templates/presentation/pages/template_info_page.dart';
import 'package:manato_web/shared/widgets/template_card.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class ShowedTemplatesSection extends StatelessWidget {
  const ShowedTemplatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemplatesBloc, TemplatesBlocState>(
      builder: (context, state) {
        if (state is TemplatesBlocStateLoaded) {
          final showingList = state.state == TemplatesViewState.activated
              ? state.activatedList
              : state.state == TemplatesViewState.all
              ? state.allList
              : state.deactivatedList;

          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2 / 3,
              mainAxisSpacing: 1.w,
              crossAxisSpacing: 1.w,
            ),
            itemCount: showingList.length,

            itemBuilder: (context, index) => TemplateCard(
              onTap: () {
                //context.go('/templates/edit_template');

                showShadSheet(context: context,
                side: ShadSheetSide.right,
                 builder: (context) {
                  return TemplateInfoPage(template: showingList[index]);
                });

              },
              onEditTap: () {
                //context.go('/templates/edit_template');

                showShadSheet(context: context,
                side: ShadSheetSide.right,
                 builder: (context) {
                  return EditTemplatePage();
                });
              },
              template: showingList[index],
              onDeleteTap: () => context.read<TemplatesBloc>().add(
                TemplatesBlocEventDeleteTemplate(template: showingList[index]),
              ),
              
              onCheckBoxChanged: (value) {
                context.read<TemplatesBloc>().add(
                  TemplatesBlocEventToogleVisibleTemplate(
                    template: showingList[index],
                  ),
                );
              },
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
