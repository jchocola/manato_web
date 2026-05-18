import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:manato_web/core/constants/app_images.dart';
import 'package:manato_web/core/theme/app_colors.dart';
import 'package:manato_web/core/widgets/app_button.dart';
import 'package:manato_web/features/landing/presentation/pages/landing_page.dart';
import 'package:sizer/sizer.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  // Функция плавного скролла
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.w),
                ),
                child: Text(
                  'AI Power at Your Fingertips ✨',
                  style: TextStyle(fontSize: 1.6.w),
                ),
              ),

              Gap(4.w),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Generate Stunning\n',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 3.w,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                    TextSpan(
                      text: 'Images with AI',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 3.w,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),

              Gap(3.w),

              SizedBox(
                width: 45.w,
                child: Text(
                  'Create unique high-quality visuals in seconds. Unleash your creativity and bring your ideas to life.',
                  style: TextStyle(
                    fontSize: 2.w,
                    color: AppColors.textGrey,
                    height: 1.7,
                  ),
                ),
              ),

              Gap(3.w),

              Row(
                spacing: 1.w,
                children: [
                  AppButton(
                    title: 'Get Started',
                    onTap: () {
                      scrollToSection(availableKey);
                    },
                  ),

                  OutlinedButton(
                    onPressed: () {
                      scrollToSection(faqKey);
                    },
                    child: Text(
                      'Learn More',
                      style: TextStyle(fontSize: 1.4.w),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(child: Image.asset(AppImages.mascot, height: 30.h)),
      ],
    );
  }
}
