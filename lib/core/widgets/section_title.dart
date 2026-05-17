import 'package:flutter/widgets.dart';
import 'package:manato_web/core/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style:  TextStyle(
            fontSize: 4.w,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          subtitle,
          style:  TextStyle(
            fontSize: 2.w,
            color: AppColors.textGrey,
          ),
        ),
      ],
    );
  }
}