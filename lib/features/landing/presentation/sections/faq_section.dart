import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manato_web/core/widgets/section_title.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 120,
        vertical: 100,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Frequently Asked Questions',
            subtitle: 'Everything you need to know.',
          ),

          const SizedBox(height: 60),

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
      ),
    );
  }
}