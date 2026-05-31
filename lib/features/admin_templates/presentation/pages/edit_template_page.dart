import 'package:flutter/material.dart';
import 'package:manato_web/features/admin_templates/presentation/sections/content_prompt_section.dart';
import 'package:manato_web/shared/widgets/custom_input.dart';
import 'package:manato_web/shared/widgets/custom_select.dart';
import 'package:manato_web/shared/widgets/custom_textarea.dart';
import 'package:manato_web/shared/widgets/picked_image_card.dart';
import 'package:manato_web/shared/widgets/tag_card.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class EditTemplatePage extends StatelessWidget {
  const EditTemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadSheet(
      constraints: BoxConstraints(maxWidth: 70.w, minWidth: 60.w),
      child: Column(
        spacing: 1.w,
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('Id : 1234567890'),
              ShadSwitch(value: true, onChanged: (v) {}),
            ],
          ),
          CustomInput(title: 'Template Name'),
          CustomTextArea(title: 'Template Description'),

          Row(
            spacing: 1.w,
            children: [
              Expanded(child: CustomInput(title: 'Template rating')),
              Expanded(child: CustomInput(title: 'Template used count')),
            ],
          ),

          Row(
            crossAxisAlignment: .end,
            spacing: 1.w,
            children: [
              Flexible(child: CustomInput(title: 'Template tags')),
              ShadButton(child: Icon(Icons.add), onPressed: () {}),
            ],
          ),
          Wrap(
            spacing: 1.w,
            runSpacing: 1.w,
            children: List.generate(
              5,
              (index) => Chip(label: Text('Tag $index'), onDeleted: () {}),
            ),
          ),

          CustomTextArea(title: 'Prompt'),

          Row(
            spacing: 1.w,
            crossAxisAlignment: .end,
            children: [
              Text('Parameters'),
              Expanded(child: CustomInput(title: 'Parameter name')),
              Expanded(child: CustomInput(title: 'Parameter value')),
               ShadButton(child: Icon(Icons.add), onPressed: () {}), 
            ],
          ),
          ParametersSection(),


        Row(
          spacing: 1.w,
          children: [
            CustomSelect(title: 'Category',),
            CustomSelect(title: 'Special Tag')
          ],
        ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 1.w,
              children: [
                PickedImageCard(),
                 PickedImageCard(),
                  PickedImageCard(), 
              ],
            ),
          ),



          Align(
            alignment: Alignment.centerRight,
            child: ShadButton(
              child: Text('Save Changes'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
