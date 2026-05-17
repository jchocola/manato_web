import 'package:flutter/widgets.dart';
import 'package:manato_web/core/theme/app_colors.dart';
import 'package:manato_web/core/widgets/app_button.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 120,
        vertical: 24,
      ),
      child: Row(
        children: [
          const Text(
            'Manato',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),

          const Spacer(),

          Row(
            children: [
              _navItem('Home'),
              _navItem('Features'),
              _navItem('Pricing'),
              _navItem('About'),
            ],
          ),

          const SizedBox(width: 32),

          AppButton(
            title: 'Get Started',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}