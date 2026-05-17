import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:manato_web/core/constants/app_icons.dart';
import 'package:manato_web/core/theme/app_colors.dart';
import 'package:manato_web/core/widgets/section_title.dart';
import 'package:sizer/sizer.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        'title': 'Diverse Templates',
        'subtitle': 'Explore a wide range of templates for any idea.',
        'icon': AppIcons.templates,
        'color': const Color(0xFF8E7BFF),
      },
      {
        'title': 'AI Customization',
        'subtitle': 'Tailor every detail to match your vision.',
        'icon': AppIcons.magic,
        'color': const Color(0xFF5B9CFF),
      },
      {
        'title': 'High Resolution',
        'subtitle': 'Download high-quality images in any format.',
        'icon': AppIcons.image,
        'color': const Color(0xFF43D9B5),
      },
      {
        'title': 'Secure Storage',
        'subtitle': 'Your creations are safe and always accessible.',
        'icon': AppIcons.security,
        'color': const Color(0xFFFFA24D),
      },
      {
        'title': 'Favorites',
        'subtitle': 'Save your favorite creations for later.',
        'icon': AppIcons.favourite,
        'color': const Color(0xFF8E7BFF),
      },
      {
        'title': 'Fast & Reliable',
        'subtitle': 'Lightning-fast generation with perfect results.',
        'icon': AppIcons.flash,
        'color': const Color(0xFFB27CFF),
      },
    ];

    return Column(
      children: [
        const SectionTitle(
          title: 'Powerful Features',
          subtitle: 'Everything you need to create stunning visuals.',
        ),

        Gap(4.w),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2.w,
            crossAxisSpacing: 2.w,
           // childAspectRatio: 4 / 3,
          ),
          itemBuilder: (context, index) {
            final feature = features[index];
            return FeatureCard(
              title: feature['title'] as String,
              subtitle: feature['subtitle'] as String,
              icon: feature['icon'] as IconData,
              iconColor: feature['color'] as Color,
            );
          },
        ),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    this.title = 'title',
    this.subtitle = 'subtitle',
    this.icon = Icons.abc,
    this.iconColor = Colors.black
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.w),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2.w,
        children: [
          Icon(icon, color: iconColor , size: 2.w,),

          Text(
            title,
            style: TextStyle(fontSize: 2.w, fontWeight: FontWeight.bold),
          ),

          Text(subtitle , style: TextStyle(fontSize: 1.6.w),),
        ],
      ),
    );
  }
}
