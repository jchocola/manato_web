import 'package:flutter/material.dart';
import 'package:manato_web/core/theme/app_colors.dart';
import 'package:sizer/sizer.dart';


class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding:  EdgeInsets.symmetric(
          horizontal: 3.w,
          vertical: 2.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onTap,
      child: Text(title),
    );
  }
}