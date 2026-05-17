import 'package:flutter/material.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

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
            'Loved by Creators',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1B4B),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'See what our amazing community says about Manato.',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF8B8BA7),
            ),
          ),

          const SizedBox(height: 70),

          /// CARDS
          Row(
            children: const [
              Expanded(
                child: TestimonialCard(
                  review:
                      '"Manato has completely changed the way I create content. The results are incredible!"',
                  name: 'Samantha Lee',
                  role: 'Digital Artist',
                  image:
                      'https://i.pravatar.cc/150?img=32',
                ),
              ),

              SizedBox(width: 24),

              Expanded(
                child: TestimonialCard(
                  review:
                      '"The templates and AI customization options are exactly what I was looking for."',
                  name: 'James Carter',
                  role: 'Graphic Designer',
                  image:
                      'https://i.pravatar.cc/150?img=12',
                ),
              ),

              SizedBox(width: 24),

              Expanded(
                child: TestimonialCard(
                  review:
                      '"Fast, easy, and secure. Manato is my go-to tool for all my projects."',
                  name: 'Olivia Brown',
                  role: 'Content Creator',
                  image:
                      'https://i.pravatar.cc/150?img=44',
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
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFFF0EEFF),
        ),
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

          const SizedBox(height: 28),

          /// REVIEW
          Text(
            review,
            style: const TextStyle(
              fontSize: 20,
              height: 1.7,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A1B4B),
            ),
          ),

          const SizedBox(height: 36),

          /// USER
          Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundImage: NetworkImage(image),
              ),

              const SizedBox(width: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1B4B),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    role,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF8B8BA7),
                    ),
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