import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class ParameterCard extends StatelessWidget {
  const ParameterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 1.w,
      children: [
        ShadButton.ghost(child: Icon(Icons.delete)),
        // TEMPLATE NAME
        Expanded(flex: 1, child: ShadInput()),

        //TEMPLATE ID
        Expanded(flex: 2, child: ShadInput()),
      ],
    );
  }
}
