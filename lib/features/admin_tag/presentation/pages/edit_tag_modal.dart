import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin_tag/presentation/blocs/picked_tag_bloc.dart';
import 'package:manato_web/features/admin_tag/presentation/blocs/tags_bloc.dart';
import 'package:manato_web/shared/widgets/custom_input.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class EditTagModal extends StatefulWidget {
  const EditTagModal({super.key});

  @override
  State<EditTagModal> createState() => _EditTagModalState();
}

class _EditTagModalState extends State<EditTagModal> {
  late TextEditingController titleController;

  @override
  void initState() {
    super.initState();

    final state = context.read<PickedTagBloc>().state;
    titleController = TextEditingController(
      text: (state is PickedTagBlocStatePicked) ? state.tag.title : '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickedTagBloc, PickedTagBlocState>(
      builder: (context, state) {
        if (state is PickedTagBlocStatePicked) {
          return Padding(
            padding: EdgeInsets.all(2.w),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 1.w,
              children: [
                CustomInput(controller: titleController),

                Text(state.tag.id),

                Center(
                  child: ShadButton(
                    child: Text('Comfirm'),
                    onPressed: () {
                      final modifiedTag = state.tag.copyWith(
                        title: titleController.text,
                      );
                  
                      context.read<TagsBloc>().add( TagsBlocEventEditTag
                        (modifiedTag: modifiedTag),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
