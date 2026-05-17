import 'package:flutter/material.dart';

class WhyChooseSection extends StatelessWidget {
  const WhyChooseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 120,
        vertical: 100,
      ),
      child: Column(
        children: [
          /// TITLE
          const Text(
            'Why Choose Manato?',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1B4B),
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            'Built for creators, by creators.',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF8B8BA7),
            ),
          ),

          const SizedBox(height: 80),

          /// CONTENT
          Row(
            children: [
              /// LEFT IMAGE
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// GLOW
                    Container(
                      width: 420,
                      height: 420,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            const Color(0xFF8E7BFF)
                                .withOpacity(0.12),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),

                    /// CHARACTER
                    Image.asset(
                      'assets/images/mascot_heart.png',
                      height: 480,
                    ),

                    /// STARS
                    Positioned(
                      top: 40,
                      left: 80,
                      child: _buildSparkle(),
                    ),

                    Positioned(
                      bottom: 90,
                      right: 70,
                      child: _buildSparkle(),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 80),

              /// RIGHT FEATURES
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    WhyChooseItem(
                      title: 'User-Friendly Interface',
                      subtitle:
                          'Designed for everyone, from beginners to professionals.',
                    ),

                    SizedBox(height: 38),

                    WhyChooseItem(
                      title: 'Cutting-Edge AI',
                      subtitle:
                          'Leverage the latest AI technology for unmatched results.',
                    ),

                    SizedBox(height: 38),

                    WhyChooseItem(
                      title: 'Community-Driven',
                      subtitle:
                          'Join a growing community of creators and share your work.',
                    ),

                    SizedBox(height: 38),

                    WhyChooseItem(
                      title: 'Constantly Improving',
                      subtitle:
                          'We’re always adding new features and templates for you.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSparkle() {
    return const Icon(
      Icons.auto_awesome,
      color: Color(0xFFE6D7FF),
      size: 26,
    );
  }
}

class WhyChooseItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const WhyChooseItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ICON
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF8E7BFF),
              width: 2,
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.check,
              size: 18,
              color: Color(0xFF8E7BFF),
            ),
          ),
        ),

        const SizedBox(width: 20),

        /// TEXT
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1B4B),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 17,
                  height: 1.7,
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