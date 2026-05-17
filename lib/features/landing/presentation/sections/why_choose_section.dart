import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:manato_web/core/constants/app_images.dart';
import 'package:manato_web/core/widgets/section_title.dart';
import 'package:sizer/sizer.dart';

class WhyChooseSection extends StatelessWidget {
  const WhyChooseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
     
      child: Column(
        children: [

          SectionTitle(title: 'Why Choose Manato?', subtitle: 'Built for creators, by creators.'),
         
        Gap(5.w),

          /// CONTENT
          Row(
            children: [
              /// LEFT IMAGE
              Expanded(
                child:   /// CHARACTER
                    Image.asset(
                    AppImages.withHeart,
                      height: 40.w,
                      width: 40.w,
                    ),

              ),

           

              /// RIGHT FEATURES
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2.w,
                  children: const [
                    WhyChooseItem(
                      title: 'User-Friendly Interface',
                      subtitle:
                          'Designed for everyone, from beginners to professionals.',
                    ),

                  

                    WhyChooseItem(
                      title: 'Cutting-Edge AI',
                      subtitle:
                          'Leverage the latest AI technology for unmatched results.',
                    ),

                  

                    WhyChooseItem(
                      title: 'Community-Driven',
                      subtitle:
                          'Join a growing community of creators and share your work.',
                    ),

                   

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
          width: 3.w,
          height: 3.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF8E7BFF),
              width: 2,
            ),
          ),
          child:  Center(
            child: Icon(
              Icons.check,
              size: 2.w,
              color: Color(0xFF8E7BFF),
            ),
          ),
        ),

     Gap(1.w),

        /// TEXT
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:  TextStyle(
                  fontSize: 2.w,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1B4B),
                ),
              ),

             Gap(1.w),

              Text(
                subtitle,
                style:  TextStyle(
                  fontSize: 1.5.w,
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