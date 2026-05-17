import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manato_web/core/theme/app_colors.dart';
import 'package:manato_web/core/widgets/app_button.dart';
import 'package:manato_web/core/widgets/section_title.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 120,
        vertical: 100,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Pricing Plans',
            subtitle: 'Choose the perfect plan.',
          ),

          const SizedBox(height: 60),

          Row(
            children: const [
              Expanded(
                child: PricingCard(
                  title: 'Free',
                  price: '\$0',
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: PricingCard(
                  title: 'Pro',
                  price: '\$9.99',
                  highlighted: true,
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: PricingCard(
                  title: 'Unlimited',
                  price: '\$19.99',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final bool highlighted;

  const PricingCard({
    super.key,
    required this.title,
    required this.price,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: highlighted ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: highlighted ? Colors.white : AppColors.textDark,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            price,
            style: TextStyle(
              color: highlighted ? Colors.white : AppColors.textDark,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 32),

          SizedBox(
            width: double.infinity,
            child: AppButton(
              title: 'Start Free Trial',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

