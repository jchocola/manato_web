import 'package:flutter/material.dart';
import 'package:manato_web/main.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CustomSelect extends StatelessWidget {
 const CustomSelect({super.key, this.title = 'Title', this.options = const ['Option 1', 'Option 2', 'Option 3'], this.value, this.onChanged});
  final String title;
  final List<String> options;
  final String? value;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(title),
        ShadSelect<String>(
          selectedOptionBuilder: (context, value) => Text(value ),
          placeholder: Text('Select an option'),
          options: options.map((e) => ShadOption<String>(value: e, child: Text(e))).toList(),
        
          onChanged: onChanged ?? (v) => logger.i(v),
        ),
      ],
    );
  }
}
