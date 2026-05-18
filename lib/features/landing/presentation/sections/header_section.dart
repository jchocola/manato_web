import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:manato_web/core/theme/app_colors.dart';
import 'package:manato_web/core/widgets/app_button.dart';
import 'package:manato_web/features/landing/presentation/pages/landing_page.dart';
import 'package:sizer/sizer.dart';

enum LandingSection {
  home,
  howItWorks,
  features,
  about,
  faq,
}
class HeaderSection extends StatefulWidget implements PreferredSizeWidget {
  const HeaderSection({super.key});
  @override
  Size get preferredSize => Size.fromHeight(10.h);

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {

     LandingSection currentSection = LandingSection.home;

  // Функция плавного скролла
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeInOut,
      );
    }
  }

  void selectSection(
  LandingSection section,
  GlobalKey key,
) {
  setState(() {
    currentSection = section;
  });

  final context = key.currentContext;

  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
      child: Row(
        children: [
          Text(
            'Manato',
            style: TextStyle(
              fontSize: 3.w,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),

          Gap(5.w),

          // const Spacer(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: .end,
                children: [
                  navItem(
                    title: 'Home',
                    onTap: () {
                      selectSection(LandingSection.home, homeKey);
                    },
                    isPicked: currentSection == LandingSection.home,
                  ),
                  navItem(
                    title: 'How is works',
                    onTap: () {
                      scrollToSection(howIsWorksKey);
                    },
                  ),
                  navItem(
                    title: 'Features',
                    onTap: () {
                      scrollToSection(featureKey);
                    },
                  ),
                  // navItem(
                  //   title: 'Pricing',
                  //   onTap: () {
                  //     scrollToSection(homeKey);
                  //   },
                  // ),
                  navItem(
                    title: 'About',
                    onTap: () {
                      scrollToSection(aboutKey);
                    },
                  ),
                  navItem(
                    title: 'FAQs',
                    onTap: () {
                      scrollToSection(faqKey);
                    },
                  ),
                ],
              ),
            ),
          ),

          Gap(2.w),

          AppButton(
            title: 'Get Started',
            onTap: () {
              scrollToSection(availableKey);
            },
          ),
        ],
      ),
    );
  }
}

class navItem extends StatelessWidget {
  const navItem({super.key, this.title = 'title', this.onTap, this.isPicked = false});
  final String title;
  final void Function()? onTap;
  final bool isPicked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        child: Text(
          title,
          
          style: TextStyle(fontSize: 1.5.w, fontWeight: FontWeight.w500 , decoration: TextDecoration.combine([
            isPicked ? TextDecoration.underline : TextDecoration.none
          ])),
        ),
      ),
    );
  }
}
