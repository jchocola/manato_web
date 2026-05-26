import 'package:flutter/material.dart';
import 'package:manato_web/shared/widgets/template_card.dart';

class UncategoriedTemplatesSection extends StatelessWidget {
  const UncategoriedTemplatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('UnCategorired Templates'),
        Expanded(child: _uncategoriedTemplates()),
      ],
    );
  }
}

class _uncategoriedTemplates extends StatelessWidget {
  const _uncategoriedTemplates({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => TemplateCard(),
      separatorBuilder: (context, index) => Divider(),
      itemCount: 30,
    );
  }
}
