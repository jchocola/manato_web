import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manato_web/core/theme/app_colors.dart';
import 'package:manato_web/core/widgets/section_title.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

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
            title: 'Powerful Features',
            subtitle: 'Everything you need to create stunning visuals.',
          ),

          const SizedBox(height: 60),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: 1.8,
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppColors.border,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.auto_awesome),
                    SizedBox(height: 16),
                    Text(
                      'AI Customization',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: 12),
                    Text(
                      'Tailor every detail to match your vision.',
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}