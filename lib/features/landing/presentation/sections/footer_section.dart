import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF1F0FF))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LOGO
          Expanded(
            flex: 2,
            child: Row(
              spacing: 1.w,
              children: [
                Container(
                  width: 2.w,
                  height: 2.w,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8E7BFF), Color(0xFFC6B7FF)],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.auto_awesome, color: Colors.white),
                ),

                Text(
                  'Manato',
                  style: TextStyle(
                    fontSize: 4.w,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1B4B),
                  ),
                ),

                Icon(Icons.star, color: Color(0xFFFFA9E7), size: 1.5.w),
              ],
            ),
          ),

          /// PRODUCT
          Expanded(
            child: _buildFooterColumn(
              title: 'Product',
              items: ['Features', 'Templates', 'Pricing', 'Updates'],
            ),
          ),

          /// COMPANY
          Expanded(
            child: _buildFooterColumn(
              title: 'Company',
              items: ['About Us', 'Blog', 'Careers', 'Contact'],
            ),
          ),

          /// LEGAL
          Expanded(
            child: _buildFooterColumn(
              title: 'Legal',
              items: ['Terms of Service', 'Privacy Policy', 'Refund Policy'],
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

                Gap(2.w),

                Row(
                  spacing: 1.w,
                  children: [
                    _socialButton(Icons.camera_alt_outlined),

                    _socialButton(Icons.flutter_dash),

                    _socialButton(Icons.sports_esports_outlined),

                    _socialButton(Icons.smart_display_outlined),
                  ],
                ),

                Gap(2.w),

                Text(
                  '© 2024 Manato. All rights reserved.',
                  style: TextStyle(fontSize: 1.5.w, color: Color(0xFF9B9CB3)),
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
          style: TextStyle(
            fontSize: 1.7.w,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1B4B),
          ),
        ),

        Gap(2.w),

        /// ITEMS
        ...items.map(
          (item) => Padding(
            padding: EdgeInsets.only(bottom: 2.w),
            child: InkWell(
              onTap: () {},
              child: Text(
                item,
                style: TextStyle(fontSize: 1.4.w, color: Color(0xFF8B8BA7)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _socialButton(IconData icon) {
    return Container(
      width: 3.w,
      height: 3.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F5FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(icon, color: const Color(0xFF7B61FF), size: 2.w),
    );
  }
}
