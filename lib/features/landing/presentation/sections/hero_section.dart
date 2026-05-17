import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manato_web/core/constants/app_images.dart';
import 'package:manato_web/core/theme/app_colors.dart';
import 'package:manato_web/core/widgets/app_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 80),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Text('AI Power at Your Fingertips ✨'),
                ),

                const SizedBox(height: 32),

                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Generate Stunning\n',
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      TextSpan(
                        text: 'Images with AI',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                const SizedBox(
                  width: 520,
                  child: Text(
                    'Create unique high-quality visuals in seconds. Unleash your creativity and bring your ideas to life.',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textGrey,
                      height: 1.7,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                Row(
                  children: [
                    AppButton(title: 'Get Started', onTap: () {}),
                    const SizedBox(width: 16),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Learn More'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: Image.asset(AppImages.mascot, height: 550)),
        ],
      ),
    );
  }
}
