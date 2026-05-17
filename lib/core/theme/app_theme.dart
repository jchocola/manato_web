import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manato_web/core/theme/app_colors.dart';


class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      textTheme: GoogleFonts.interTextTheme(),
      useMaterial3: true,
    );
  }
}