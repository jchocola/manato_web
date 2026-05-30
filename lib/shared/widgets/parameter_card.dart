import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class ParameterCard extends StatelessWidget {
  const ParameterCard({
    super.key,
    required this.parameterKey,
    required this.parameterValue,
    required this.index,
    this.onPressed
  });

  final String parameterKey;
  final String parameterValue;
  final int index;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 1.w,
      children: [
        ShadButton.ghost(child: Icon(Icons.delete), onPressed: onPressed,),
        // TEMPLATE NAME
        Expanded(flex: 1, child: Text(parameterKey)),

        //TEMPLATE ID
        Expanded(flex: 2, child: Text(parameterValue)),
      ],
    );
  }
}
