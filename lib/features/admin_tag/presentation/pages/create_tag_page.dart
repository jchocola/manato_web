import 'package:flutter/widgets.dart';
import 'package:manato_web/shared/widgets/custom_input.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class CreateTagPage extends StatelessWidget {
  const CreateTagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(2.w),
      child: Column(
        spacing: 1.w,
        children: [
          CustomInput(title: 'Tag name',),
           CustomInput(title: 'Tag tag',),
          ShadButton(child: Text('Create'),)
        ],
      ),
    );
  }
}
