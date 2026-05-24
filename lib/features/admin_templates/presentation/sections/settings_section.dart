import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Settings'),

          Row(
            spacing: 1.w,
            children: [
              // CATEGORY
              Expanded(
                child: ShadSelect(
                  optionsBuilder: (context, index)=> Text(index.toString()),
                  selectedOptionBuilder: (context, index) =>
                      Text(index.toString()),
                ),
              ),

              //TEMPLATE ID
              Expanded( child: ShadSelect(
                  optionsBuilder: (context, index)=> Text(index.toString()),
                  selectedOptionBuilder: (context, index) =>
                      Text(index.toString()),
                ),),

              Expanded(child: ShadInput()),
            ],
          ),
        ],
      ),
    );
  }
}
