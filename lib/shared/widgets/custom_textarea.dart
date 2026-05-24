import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CustomTextArea extends StatelessWidget {
  const CustomTextArea({super.key, this.title = 'title', this.controller});
  final String title;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [Text(title), ShadTextarea(controller: controller,)]);
  }
}
