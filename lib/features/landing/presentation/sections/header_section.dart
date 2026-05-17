import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:manato_web/core/theme/app_colors.dart';
import 'package:manato_web/core/widgets/app_button.dart';
import 'package:sizer/sizer.dart';

class HeaderSection extends StatelessWidget implements PreferredSizeWidget {
  const HeaderSection({super.key});

  @override
  Size get preferredSize => Size.fromHeight(10.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
      child: Row(
        children: [
           Text(
            'Manato',
            style: TextStyle(
              fontSize: 5.w,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),

          Gap(10.w),

         // const Spacer(),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: .end,
                children: [
                  _navItem('Home'),
                   _navItem('How is works'),
                  _navItem('Features'),
                  _navItem('Pricing'),
                  _navItem('About'),
                ],
              ),
            ),
          ),

          Gap(2.w),

          AppButton(title: 'Get Started', onTap: () {}),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 1.w),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
