import 'package:flutter/material.dart';

class FeaturesBannerSection extends StatelessWidget {
  const FeaturesBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 120),
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 36,
      ),
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
        children: const [
          Expanded(
            child: FeatureItem(
              icon: Icons.auto_awesome_outlined,
              title: 'AI-Powered',
              subtitle:
                  'Advanced models deliver perfect results',
            ),
          ),

          SizedBox(width: 28),

          Expanded(
            child: FeatureItem(
              icon: Icons.construction_outlined,
              title: 'Easy to Use',
              subtitle:
                  'Simple interface for everyone',
            ),
          ),

          SizedBox(width: 28),

          Expanded(
            child: FeatureItem(
              icon: Icons.shield_outlined,
              title: 'Secure & Private',
              subtitle:
                  'Your data is protected and encrypted',
            ),
          ),

          SizedBox(width: 28),

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
      children: [
        /// ICON CONTAINER
        Container(
          width: 68,
          height: 68,
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

        const SizedBox(width: 20),

        /// TEXT
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TITLE
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1B4B),
                ),
              ),

              const SizedBox(height: 10),

              /// SUBTITLE
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
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