import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:manato_web/core/widgets/section_title.dart';
import 'package:sizer/sizer.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
   
      child: Column(
        children: [

          SectionTitle(title: 'How It Works', subtitle: 'Create amazing images in just a few simple steps.'),
      
       Gap(3.w),

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
          width: 5.w,
          height: 5.w,
          decoration: BoxDecoration(
            color: const Color(0xFFF6F2FF),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Icon(
            icon,
            size: 3.w,
            color: const Color(0xFF7B61FF),
          ),
        ),

      Gap(2.w),

        /// NUMBER
        Text(
          number,
          style:  TextStyle(
            fontSize: 3.w,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7B61FF),
          ),
        ),

       Gap(1.w),

        /// TITLE
        SizedBox(
          height: 4.h,
          child: Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 2.w,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1B4B),
            ),
          ),
        ),

     //  Gap(1.w),

        /// SUBTITLE
        SizedBox(
          height: 3.h,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            style:  TextStyle(
              fontSize: 1.3.w,
              height: 1.6,
              color: Color(0xFF8B8BA7),
            ),
          ),
        ),
      ],
    );
  }
}