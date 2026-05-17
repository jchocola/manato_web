import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:manato_web/core/widgets/section_title.dart';
import 'package:sizer/sizer.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      child: Column(
        children: [
          SectionTitle(
            title: 'Loved by Creators',
            subtitle: 'See what our amazing community says about Manato.',
          ),

          Gap(5.w),

          /// CARDS
          Row(
            children: const [
              Expanded(
                child: TestimonialCard(
                  review:
                      '"Manato has completely changed the way I create content. The results are incredible!"',
                  name: 'Samantha Lee',
                  role: 'Digital Artist',
                  image: 'https://i.pravatar.cc/150?img=32',
                ),
              ),

              SizedBox(width: 24),

              Expanded(
                child: TestimonialCard(
                  review:
                      '"The templates and AI customization options are exactly what I was looking for."',
                  name: 'James Carter',
                  role: 'Graphic Designer',
                  image: 'https://i.pravatar.cc/150?img=12',
                ),
              ),

              SizedBox(width: 24),

              Expanded(
                child: TestimonialCard(
                  review:
                      '"Fast, easy, and secure. Manato is my go-to tool for all my projects."',
                  name: 'Olivia Brown',
                  role: 'Content Creator',
                  image: 'https://i.pravatar.cc/150?img=44',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final String review;
  final String name;
  final String role;
  final String image;

  const TestimonialCard({
    super.key,
    required this.review,
    required this.name,
    required this.role,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFF0EEFF)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 1.w,
        children: [
          /// STARS
          Row(
            children: List.generate(
              5,
              (index) => const Padding(
                padding: EdgeInsets.only(right: 4),
                child: Icon(
                  Icons.star_rounded,
                  color: Color(0xFFFFC83D),
                  size: 22,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 12.h,
            child:
                /// REVIEW
                Text(
                  review,
                  style: TextStyle(
                    fontSize: 1.5.w,
                    height: 1.7,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1B4B),
                  ),
                ),
          ),

          /// USER
          Row(
            spacing: 1.w,
            children: [
              CircleAvatar(radius: 2.w, backgroundImage: NetworkImage(image)),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 1.5.w,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1B4B),
                    ),
                  ),

                  Gap(1.w),

                  Text(
                    role,
                    style: TextStyle(fontSize: 1.w, color: Color(0xFF8B8BA7)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
