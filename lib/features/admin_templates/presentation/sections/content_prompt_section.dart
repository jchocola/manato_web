import 'package:flutter/material.dart';
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
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 400),
            child: const ShadTextarea(
              placeholder: Text('Type your message here'),
            ),
          ),

          // BEFOR AFTER THUMBNAIL
          Row(
            mainAxisAlignment: .spaceAround,
            children: [PickedImageCard(), PickedImageCard(), PickedImageCard()],
          ),

          // TAG
          ShadInput(),
          Row(
            spacing: 1.w,
            children: List.generate(
              5,
              (index) => ShadBadge(child: Text(index.toString())),
            ),
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
             Row(
            spacing: 1.w,
            children: [
              ShadButton.ghost(child: Icon(Icons.delete),),
              // TEMPLATE NAME
              Expanded( flex: 1, child: ShadInput()),

              //TEMPLATE ID
              Expanded(flex: 2, child: ShadInput()),
            ],
          ),
            Row(
            spacing: 1.w,
            children: [
                ShadButton.ghost(child: Icon(Icons.delete),),
              // TEMPLATE NAME
              Expanded( flex: 1, child: ShadInput()),

              //TEMPLATE ID
              Expanded(flex: 2, child: ShadInput()),
            ],
          ),
            Row(
            spacing: 1.w,
            children: [
                ShadButton.ghost(child: Icon(Icons.delete),),
              // TEMPLATE NAME
              Expanded( flex: 1, child: ShadInput()),

              //TEMPLATE ID
              Expanded(flex: 2, child: ShadInput()),
            ],
          ),
      ],
    );
  }
}
