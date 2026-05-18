import 'package:flutter/material.dart';
import 'package:manato_web/features/landing/presentation/sections/about_section.dart';
import 'package:manato_web/features/landing/presentation/sections/available_on_section.dart';
import 'package:manato_web/features/landing/presentation/sections/cta_section.dart';
import 'package:manato_web/features/landing/presentation/sections/faq_section.dart';
import 'package:manato_web/features/landing/presentation/sections/feature_banner_section.dart';
import 'package:manato_web/features/landing/presentation/sections/features_section.dart';
import 'package:manato_web/features/landing/presentation/sections/footer_section.dart';
import 'package:manato_web/features/landing/presentation/sections/gallery_section.dart';
import 'package:manato_web/features/landing/presentation/sections/header_section.dart';
import 'package:manato_web/features/landing/presentation/sections/hero_section.dart';
import 'package:manato_web/features/landing/presentation/sections/how_it_work_section.dart';
import 'package:manato_web/features/landing/presentation/sections/testimonilas_section.dart';
import 'package:manato_web/features/landing/presentation/sections/why_choose_section.dart';
import 'package:sizer/sizer.dart';

// Ключи для секций
final homeKey = GlobalKey();
final howIsWorksKey = GlobalKey();
final featureKey = GlobalKey();
final availableKey = GlobalKey();
final galleryKey = GlobalKey();
final aboutKey = GlobalKey();
final faqKey = GlobalKey();

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderSection(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                spacing: 5.w,
                children: [
                  // HeaderSection(),
                  HeroSection(key: homeKey),

                  FeaturesBannerSection(),
                  HowItWorksSection(key: howIsWorksKey),
                  FeaturesSection(key: featureKey),
                  AvailableOnStoresSection(key: availableKey),
                  // PricingSection(),
                  TestimonialsSection(),
                  GallerySection(key: galleryKey),
                ],
              ),
            ),

            Transform.rotate(
              angle: -0.06,
              child: Column(
                spacing: 1.w,
                children: [TemplatesSection(), TemplatesSection()],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  WhyChooseSection(),
                  AboutSection(key: aboutKey),
                  FAQSection(key: faqKey),
                ],
              ),
            ),
            CTASection(),

            FooterSection(),
          ],
        ),
      ),
    );
  }
}
