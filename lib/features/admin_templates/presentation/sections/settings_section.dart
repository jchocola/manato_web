import 'package:flutter/material.dart';
import 'package:manato_web/shared/widgets/custom_input.dart';
import 'package:manato_web/shared/widgets/custom_select.dart';
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
                child: CustomSelect(title: 'Category',)
              ),

               //TEMPLATE ID
              Expanded(
                child: CustomSelect(title: 'Special Tag',)
              ),

              //TEMPLATE ID
              Expanded(
                child: CustomSelect(title: 'Stars',)
              ),

              Expanded(child: CustomInput(title: 'Used',)),
            ],
          ),
        ],
      ),
    );
  }
}
