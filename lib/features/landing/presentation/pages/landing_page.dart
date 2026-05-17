import 'package:flutter/material.dart';
import 'package:manato_web/features/landing/presentation/sections/about_section.dart';
import 'package:manato_web/features/landing/presentation/sections/cta_section.dart';
import 'package:manato_web/features/landing/presentation/sections/faq_section.dart';
import 'package:manato_web/features/landing/presentation/sections/features_section.dart';
import 'package:manato_web/features/landing/presentation/sections/footer_section.dart';
import 'package:manato_web/features/landing/presentation/sections/gallery_section.dart';
import 'package:manato_web/features/landing/presentation/sections/header_section.dart';
import 'package:manato_web/features/landing/presentation/sections/hero_section.dart';
import 'package:manato_web/features/landing/presentation/sections/how_it_work_section.dart';
import 'package:manato_web/features/landing/presentation/sections/pricing_section.dart';
import 'package:manato_web/features/landing/presentation/sections/testimonilas_section.dart';
import 'package:manato_web/features/landing/presentation/sections/why_choose_section.dart';


class LandingPage extends StatelessWidget {
   const LandingPage({super.key});

// final homeKey = GlobalKey();
// final pricingKey = GlobalKey();
// final faqKey = GlobalKey();

// Scrollable.ensureVisible(
//   pricingKey.currentContext!,
//   duration: const Duration(milliseconds: 700),
//   curve: Curves.easeInOut,
// );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderSection(),
            HeroSection(),
            HowItWorksSection(),
            FeaturesSection(),
            PricingSection(),
            TestimonialsSection(),
            GallerySection(),
            WhyChooseSection(),
            AboutSection(),
            FAQSection(),
            CTASection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}