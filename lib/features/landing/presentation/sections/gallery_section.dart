import 'package:flutter/widgets.dart';
import 'package:manato_web/core/constants/app_images.dart';
import 'package:manato_web/core/widgets/section_title.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final images = [
      AppImages.gallery1,
      AppImages.gallery2,
      AppImages.gallery3,
      AppImages.gallery4,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 120,
        vertical: 100,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Gallery',
            subtitle: 'Explore amazing creations.',
          ),

          const SizedBox(height: 60),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: images.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}