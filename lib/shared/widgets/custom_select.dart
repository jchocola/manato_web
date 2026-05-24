import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CustomSelect extends StatelessWidget {
  const CustomSelect({super.key, this.title = 'Title'});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(title),
        ShadSelect(
          optionsBuilder: (context, index) => Text(index.toString()),
          selectedOptionBuilder: (context, index) => Text(index.toString()),
        ),
      ],
    );
  }
}
