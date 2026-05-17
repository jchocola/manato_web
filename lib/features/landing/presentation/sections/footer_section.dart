import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 120,
        vertical: 60,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFF1F0FF),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LOGO
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF8E7BFF),
                        Color(0xFFC6B7FF),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(width: 14),

                const Text(
                  'Manato',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1B4B),
                  ),
                ),

                const SizedBox(width: 6),

                const Icon(
                  Icons.star,
                  color: Color(0xFFFFA9E7),
                  size: 18,
                ),
              ],
            ),
          ),

          /// PRODUCT
          Expanded(
            child: _buildFooterColumn(
              title: 'Product',
              items: [
                'Features',
                'Templates',
                'Pricing',
                'Updates',
              ],
            ),
          ),

          /// COMPANY
          Expanded(
            child: _buildFooterColumn(
              title: 'Company',
              items: [
                'About Us',
                'Blog',
                'Careers',
                'Contact',
              ],
            ),
          ),

          /// LEGAL
          Expanded(
            child: _buildFooterColumn(
              title: 'Legal',
              items: [
                'Terms of Service',
                'Privacy Policy',
                'Refund Policy',
              ],
            ),
          ),

          /// SOCIAL
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Follow Us',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1B4B),
                  ),
                ),

                const SizedBox(height: 28),

                Row(
                  children: [
                    _socialButton(Icons.camera_alt_outlined),
                    const SizedBox(width: 14),

                    _socialButton(Icons.flutter_dash),
                    const SizedBox(width: 14),

                    _socialButton(Icons.sports_esports_outlined),
                    const SizedBox(width: 14),

                    _socialButton(Icons.smart_display_outlined),
                  ],
                ),

                const SizedBox(height: 32),

                const Text(
                  '© 2024 Manato. All rights reserved.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9B9CB3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterColumn({
    required String title,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1B4B),
          ),
        ),

        const SizedBox(height: 24),

        /// ITEMS
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: InkWell(
              onTap: () {},
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF8B8BA7),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _socialButton(IconData icon) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F5FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(
        icon,
        color: const Color(0xFF7B61FF),
        size: 22,
      ),
    );
  }
}