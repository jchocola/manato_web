import 'package:flutter/widgets.dart';
import 'package:manato_web/core/constants/app_images.dart';
import 'package:manato_web/core/theme/app_colors.dart';
import 'package:manato_web/core/widgets/app_button.dart';
import 'package:sizer/sizer.dart';

class CTASection extends StatelessWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .centerRight,
      children: [
        Container(
          height: 10.h,
          padding:  EdgeInsets.symmetric(vertical:  3.w ,horizontal:  10.w),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
           // borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
           spacing: 2.w,
            children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 1.w,
                children: [
                  Text(
                    'Ready to bring your ideas to life?',
                    style: TextStyle(
                      fontSize: 2.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 
                  Text(
                    'Join thousands of creators today.',
                  ),
                ],
              ),
              AppButton(
                title: 'Get Started',
                onTap: () {},
              ),
            ],
          ),
        ),

        Image.asset(AppImages.getStart , height: 20.h,width: 20.h,),
      ],
    );
  }
}