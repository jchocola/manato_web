import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(
        horizontal: 120,
        vertical: 100,
      ),
      child: Column(
        children: [
          /// TITLE
          const Text(
            'Gallery',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1B4B),
            ),
          ),

          const SizedBox(height: 16),

          /// SUBTITLE
          const Text(
            'Explore stunning creations made by our community.',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF8B8BA7),
            ),
          ),

          const SizedBox(height: 50),

          /// CATEGORY CHIPS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              categories.length,
              (index) {
                final isSelected = selectedCategory == index;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () {
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF7B61FF)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected
                              ? Colors.transparent
                              : const Color(0xFFE9E7F7),
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: const Color(0xFF7B61FF)
                                      .withOpacity(0.25),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ]
                            : [],
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF7E809A),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 60),

          /// GALLERY GRID
          SizedBox(
            width: 1100,
            child: Wrap(
              spacing: 22,
              runSpacing: 22,
              children: List.generate(
                images.length,
                (index) {
                  final isLarge =
                      index == 4;

                  return GalleryItem(
                    image: images[index],
                    height: isLarge ? 360 : 200,
                    width: 200,
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 60),

          /// BUTTON
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF8E7BFF),
                  Color(0xFF7B61FF),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7B61FF)
                      .withOpacity(0.25),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 38,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                'Explore More',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GalleryItem extends StatefulWidget {
  final String image;
  final double width;
  final double height;

  const GalleryItem({
    super.key,
    required this.image,
    required this.width,
    required this.height,
  });

  @override
  State<GalleryItem> createState() => _GalleryItemState();
}

class _GalleryItemState extends State<GalleryItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: widget.width,
        height: widget.height,
        transform: Matrix4.identity()
          ..scale(isHovered ? 1.03 : 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                isHovered ? 0.12 : 0.05,
              ),
              blurRadius: isHovered ? 30 : 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            fit: StackFit.expand,
            children: [
              /// IMAGE
              Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),

              /// HOVER OVERLAY
              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: isHovered ? 1 : 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.45),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              /// ICON
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                bottom: isHovered ? 20 : 10,
                right: 20,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: isHovered ? 1 : 0,
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Icons.open_in_full,
                      color: Color(0xFF7B61FF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}