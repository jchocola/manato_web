import 'package:flutter/material.dart';
import 'package:manato_web/core/constants/app_images.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 120,
        vertical: 100,
      ),
      child: Row(
        children: [
          /// LEFT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE
                const Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1B4B),
                  ),
                ),

                const SizedBox(height: 20),

                /// SUBTITLE
                const SizedBox(
                  width: 450,
                  child: Text(
                    'Our mission is to empower creativity through AI technology.',
                    style: TextStyle(
                      fontSize: 22,
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4A4D6C),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                /// DESCRIPTION
                const SizedBox(
                  width: 520,
                  child: Text(
                    'We believe that everyone has a story to tell and creativity to share. Manato was built to make image generation simple, fun, and accessible to all.',
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.8,
                      color: Color(0xFF8B8BA7),
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                /// STATS
                Row(
                  children: const [
                    Expanded(
                      child: AboutStat(
                        value: '50K+',
                        label: 'Happy Users',
                      ),
                    ),

                    SizedBox(width: 32),

                    Expanded(
                      child: AboutStat(
                        value: '1M+',
                        label: 'Images Created',
                      ),
                    ),

                    SizedBox(width: 32),

                    Expanded(
                      child: AboutStat(
                        value: '100+',
                        label: 'Templates',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 80),

          /// RIGHT IMAGE
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                /// BACKGROUND GLOW
                Container(
                  width: 480,
                  height: 480,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF8E7BFF)
                            .withOpacity(0.10),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                /// IMAGE
                Image.asset(
                  AppImages.about,
                  height: 500,
                ),

                /// DECORATIVE DOTS
                Positioned(
                  top: 80,
                  left: 40,
                  child: _buildDot(),
                ),

                Positioned(
                  bottom: 100,
                  right: 40,
                  child: _buildDot(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: const Color(0xFFE9DFFF),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}

class AboutStat extends StatelessWidget {
  final String value;
  final String label;

  const AboutStat({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// VALUE
        Text(
          value,
          style: const TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7B61FF),
          ),
        ),

        const SizedBox(height: 10),

        /// LABEL
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF8B8BA7),
          ),
        ),
      ],
    );
  }
}