import 'package:flutter/material.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

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
            'How It Works',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1B4B),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'Create amazing images in just a few simple steps.',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF8B8BA7),
            ),
          ),

          const SizedBox(height: 80),

          /// STEPS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildStep(
                  icon: Icons.edit_outlined,
                  number: '1',
                  title: 'Choose a Template',
                  subtitle:
                      'Pick a template that inspires you.',
                ),
              ),

              _buildArrow(),

              Expanded(
                child: _buildStep(
                  icon: Icons.auto_awesome_outlined,
                  number: '2',
                  title: 'Customize It',
                  subtitle:
                      'Edit your prompt and settings.',
                ),
              ),

              _buildArrow(),

              Expanded(
                child: _buildStep(
                  icon: Icons.smart_toy_outlined,
                  number: '3',
                  title: 'Generate',
                  subtitle:
                      'Let our AI work its magic.',
                ),
              ),

              _buildArrow(),

              Expanded(
                child: _buildStep(
                  icon: Icons.download_outlined,
                  number: '4',
                  title: 'Download & Share',
                  subtitle:
                      'Save and share your masterpiece.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildArrow() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: Color(0xFFD2D3E0),
      ),
    );
  }

  Widget _buildStep({
    required IconData icon,
    required String number,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        /// ICON BOX
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: const Color(0xFFF6F2FF),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Icon(
            icon,
            size: 42,
            color: const Color(0xFF7B61FF),
          ),
        ),

        const SizedBox(height: 24),

        /// NUMBER
        Text(
          number,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7B61FF),
          ),
        ),

        const SizedBox(height: 16),

        /// TITLE
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1B4B),
          ),
        ),

        const SizedBox(height: 12),

        /// SUBTITLE
        SizedBox(
          width: 220,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Color(0xFF8B8BA7),
            ),
          ),
        ),
      ],
    );
  }
}