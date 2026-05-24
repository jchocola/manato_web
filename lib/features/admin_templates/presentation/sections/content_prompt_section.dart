import 'package:flutter/material.dart';
import 'package:manato_web/shared/widgets/custom_textarea.dart';
import 'package:manato_web/shared/widgets/parameter_card.dart';
import 'package:manato_web/shared/widgets/picked_image_card.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class ContentPromptSection extends StatelessWidget {
  const ContentPromptSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      child: Column(
        spacing: 1.w,
        crossAxisAlignment: .start,
        children: [
          Text('Content & Prompt'),

          // Prompt
    CustomTextArea(title: 'Prompt',),

          // BEFOR AFTER THUMBNAIL
          Row(
            mainAxisAlignment: .spaceAround,
            children: [PickedImageCard(), PickedImageCard(), PickedImageCard()],
          ),

       

          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('Parameters'),
              ShadButton.destructive(child: Icon(Icons.add)),
            ],
          ),

         ParametersSection()
        ],
      ),
    );
  }
}

class ParametersSection extends StatelessWidget {
  const ParametersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 1.w,
      children: [
        ParameterCard(),
        ParameterCard(),
      ],
    );
  }
}
