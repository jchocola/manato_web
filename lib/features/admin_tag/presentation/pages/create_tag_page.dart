import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin_tag/data/tag_model.dart';
import 'package:manato_web/features/admin_tag/presentation/blocs/tags_bloc.dart';
import 'package:manato_web/shared/widgets/custom_input.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class CreateTagPage extends StatefulWidget {
  const CreateTagPage({super.key});

  @override
  State<CreateTagPage> createState() => _CreateTagPageState();
}

class _CreateTagPageState extends State<CreateTagPage> {
  final tagTitleController = TextEditingController();
  final tagTagController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Column(
        spacing: 1.w,
        children: [
          CustomInput(title: 'Tag title', controller: tagTitleController),
          CustomInput(title: 'Tag tag', controller: tagTagController),
          ShadButton(
            child: Text('Create'),
            onPressed: () {
              final tag = TagModel(
                title: tagTitleController.text,
                id: tagTagController.text,
              );
              context.read<TagsBloc>().add(TagsBlocEventCreateTag(tag: tag));
            },
          ),
        ],
      ),
    );
  }
}
