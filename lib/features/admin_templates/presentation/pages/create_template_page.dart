import 'package:flutter/material.dart';
import 'package:manato_web/features/admin_templates/presentation/sections/basic_info_section.dart';
import 'package:manato_web/features/admin_templates/presentation/sections/content_prompt_section.dart';
import 'package:manato_web/features/admin_templates/presentation/sections/settings_section.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class CreateTemplatePage extends StatelessWidget {
  const CreateTemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create template')),
      body: webBody(context)
    );
  }

  Widget webBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.all(1.w),
        child: Column(
          spacing: 1.w,
          children: [
          BasicInfoSection(),
             ContentPromptSection(),
             SettingsSection(),
            ShadButton(child: Text('Save template'),)
          ],
        ),
      ),
    );
  }
}
