import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin_tag/presentation/blocs/picked_tag_bloc.dart';
import 'package:manato_web/features/admin_tag/presentation/blocs/tags_bloc.dart';
import 'package:manato_web/features/admin_tag/presentation/pages/edit_tag_modal.dart';
import 'package:manato_web/shared/widgets/category_card.dart';
import 'package:manato_web/shared/widgets/tag_card.dart';

class TagSection extends StatelessWidget {
  const TagSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagsBloc, TagsBlocState>(
      builder: (context, state) {
        if (state is TagsBlocStateLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: state.tags.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 1,
            ),
            itemBuilder: (context, index) {
              final tag = state.tags[index];
              return TagCard(
                tag: tag,
                onDeletePressed: () {
                  context.read<TagsBloc>().add(
                    TagsBlocEventDeleteTag(tag: tag),
                  );
                },

                onEditPressed: () {
                  context.read<PickedTagBloc>().add(PickedTagBlocEventPickedEditingTag(tag: tag));
                  showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    builder: (context) => EditTagModal(),
                  );
                },
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
