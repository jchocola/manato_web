import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:manato_web/core/constants/app_images.dart';
import 'package:manato_web/core/widgets/section_title.dart';
import 'package:sizer/sizer.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
     
      child: Row(
        children: [
          /// LEFT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SectionTitle(title: 'About Us', subtitle: 'Our mission is to empower creativity through AI technology.'),
              

                Gap(5.w),

                /// DESCRIPTION
                 SizedBox(
                  width: 45.w,
                  child: Text(
                    'We believe that everyone has a story to tell and creativity to share. Manato was built to make image generation simple, fun, and accessible to all.',
                    style: TextStyle(
                      fontSize: 1.5.w,
                      height: 1.8,
                      color: Color(0xFF8B8BA7),
                    ),
                  ),
                ),

              Gap(5.w),

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

        

          /// RIGHT IMAGE
          Expanded(
            child: Image.asset(
              AppImages.about,
              height: 40.w,
              
            ),
          ),
        ],
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
      spacing: 2.w,
      children: [
        /// VALUE
        Text(
          value,
          style:  TextStyle(
            fontSize: 4.w,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7B61FF),
          ),
        ),

      

        /// LABEL
        SizedBox(
          height: 3.h,
          child: Text(
            label,
            style:  TextStyle(
              fontSize: 1.5.w,
              color: Color(0xFF8B8BA7),
            ),
          ),
        ),
      ],
    );
  }
}