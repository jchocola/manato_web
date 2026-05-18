import 'package:flutter/material.dart';
import 'package:flutter_infinite_marquee/flutter_infinite_marquee.dart';
import 'package:gap/gap.dart';
import 'package:manato_web/core/widgets/app_button.dart';
import 'package:manato_web/core/widgets/section_title.dart';
import 'package:manato_web/core/widgets/template_card.dart';
import 'package:sizer/sizer.dart';

class GallerySection extends StatefulWidget {
  const GallerySection({super.key});

  @override
  State<GallerySection> createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  int selectedCategory = 0;

  final List<String> categories = [
    'All',
    'Art',
    'Design',
    'Photography',
    '3D',
    'Anime',
  ];

  final List<String> images = [
    'assets/gallery/gallery_1.jpg',
    'assets/gallery/gallery_2.jpg',
    'assets/gallery/gallery_3.jpg',
    'assets/gallery/gallery_4.jpg',
    'assets/gallery/gallery_5.jpg',
    'assets/gallery/gallery_6.jpg',
    'assets/gallery/gallery_7.jpg',
    'assets/gallery/gallery_8.jpg',
    'assets/gallery/gallery_9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      child: Column(
        spacing: 1.w,
        children: [
          SectionTitle(
            title: 'Gallery',
            subtitle: 'Explore stunning creations made by our community.',
          ),

          Gap(2.w),

         
         

          /// BUTTON
          AppButton(title: 'Explore More', onTap: () {}),
        ],
      ),
    );
  }
}

class TemplatesSection extends StatelessWidget {
  const TemplatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
  height: 18.h,
      child: InfiniteMarquee(
        speed: 60, // pixels per second; negative for reverse
        itemBuilder: (BuildContext context, int index) {
          return FantasyTemplateCard();
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
      ),
    );
  }
}
