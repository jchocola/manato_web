import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manato_web/features/admin_templates/presentation/blocs/templates_bloc.dart';
import 'package:manato_web/shared/widgets/template_card.dart';

class ShowedTemplatesSection extends StatelessWidget {
  const ShowedTemplatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemplatesBloc, TemplatesBlocState>(
      builder: (context, state) {
        if (state is TemplatesBlocStateLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2 / 2.3,
            ),
            itemCount: state.allList.length,

            itemBuilder: (context, index) => TemplateCard(
              onTap: () {
                context.go('/templates/edit_template');
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
