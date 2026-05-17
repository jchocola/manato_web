import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FeaturesBannerSection extends StatelessWidget {
  const FeaturesBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(2.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: const Color(0xFFF1F0FF),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        spacing: 1.w,
        children: const [
          Expanded(
            child: FeatureItem(
              icon: Icons.auto_awesome_outlined,
              title: 'AI-Powered',
              subtitle:
                  'Advanced models deliver perfect results',
            ),
          ),

       

          Expanded(
            child: FeatureItem(
              icon: Icons.construction_outlined,
              title: 'Easy to Use',
              subtitle:
                  'Simple interface for everyone',
            ),
          ),

         

          Expanded(
            child: FeatureItem(
              icon: Icons.shield_outlined,
              title: 'Secure',
              subtitle:
                  'Your data is protected and encrypted',
            ),
          ),

     

          Expanded(
            child: FeatureItem(
              icon: Icons.water_drop_outlined,
              title: 'Instant Results',
              subtitle:
                  'Generate and download in seconds.',
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 1.w,
      children: [
        /// ICON CONTAINER
        Container(
         width: 5.w,
         height: 5.w,
          decoration: BoxDecoration(
            color: const Color(0xFFF6F3FF),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF7B61FF),
            size: 30,
          ),
        ),

      

        /// TEXT
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 1.w,
            children: [
              /// TITLE
              Text(
                title,
                maxLines: 1,
                style:  TextStyle(
                  fontSize: 1.5.w,
                  
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1B4B),
                ),
              ),

           

              /// SUBTITLE
              Text(
                subtitle,
                style:  TextStyle(
                  fontSize: 1.w,
                  height: 1.6,
                  color: Color(0xFF8B8BA7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}