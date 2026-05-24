import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class PickedImageCard extends StatelessWidget {
  const PickedImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      width: 25.w,
      height: 25.h,
    );
  }
}
