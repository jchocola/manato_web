import 'package:flutter/material.dart';
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
              Expanded(child: ShadInput()),

              //TEMPLATE ID
              Expanded(child: ShadInput()),
            ],
          ),


            // DESCRIPTION
          ConstrainedBox(
  constraints: const BoxConstraints(maxHeight: 400),
  child: const ShadTextarea(
    placeholder: Text('Type your message here'),
  ),
),


             // TAG
          ShadInput(),
        ],
      ),
    );
  }
}
