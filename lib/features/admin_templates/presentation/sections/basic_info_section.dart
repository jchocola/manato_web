import 'package:flutter/material.dart';
import 'package:manato_web/shared/widgets/custom_input.dart';
import 'package:manato_web/shared/widgets/custom_textarea.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class BasicInfoSection extends StatelessWidget {
  const BasicInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      child: Column(
        spacing: 1.w,
        crossAxisAlignment: .start,
        children: [
          Text('Basic Information'),
          Row(
            spacing: 1.w,
            children: [
              // TEMPLATE NAME
              Expanded(child: CustomInput(title: 'Template Name')),

              //TEMPLATE ID
              Expanded(child: Row(
                children: [
                  Flexible(child: CustomInput(title: 'Template ID')),
                  ShadButton.ghost(child: Icon(Icons.grid_goldenratio_rounded),)
                ],
              )),
            ],
          ),

          // DESCRIPTION
          CustomTextArea(title: 'Description'),

          // TAG
          CustomInput(title: 'Tags'),
             Row(
            spacing: 1.w,
            children: List.generate(
              5,
              (index) => ShadBadge(child: Text(index.toString())),
            ),
          ),
        ],
      ),
    );
  }
}
