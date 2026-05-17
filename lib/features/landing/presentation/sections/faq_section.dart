import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:manato_web/core/widgets/section_title.dart';
import 'package:sizer/sizer.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(
          title: 'Frequently Asked Questions',
          subtitle: 'Everything you need to know.',
        ),
    
       Gap(5.w),
    
        ExpansionTile(
          title: const Text('What is Manato?'),
          children: const [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Manato is AI image generation platform.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}