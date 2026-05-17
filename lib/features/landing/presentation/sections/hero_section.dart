import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:manato_web/core/constants/app_images.dart';
import 'package:manato_web/core/theme/app_colors.dart';
import 'package:manato_web/core/widgets/app_button.dart';
import 'package:sizer/sizer.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

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
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text('AI Power at Your Fingertips ✨'),
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
                spacing: 2.w,
                children: [
                  AppButton(title: 'Get Started', onTap: () {}),

                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Learn More'),
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
