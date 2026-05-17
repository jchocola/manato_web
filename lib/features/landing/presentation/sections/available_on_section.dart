import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

class AvailableOnStoresSection extends StatelessWidget {
  const AvailableOnStoresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
    
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.w),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF5F2FF),
            Color(0xFFEDE7FF),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7B61FF).withOpacity(0.08),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Row(
        children: [
          /// LEFT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// BADGE
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child:  Text(
                    'Available on Mobile',
                    style: TextStyle(
                      fontSize: 1.6.w,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7B61FF),
                    ),
                  ),
                ),

               Gap(2.w),

                /// TITLE
                 Text(
                  'Create AI Images Anywhere',
                  style: TextStyle(
                    fontSize: 4.w,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                    color: Color(0xFF1A1B4B),
                  ),
                ),

                Gap(2.w),

                /// DESCRIPTION
                 SizedBox(
                  width: 40.w,
                  child: Text(
                    'Download Manato on iOS and Android to generate stunning AI art anytime, anywhere. Fast, secure, and built for creators.',
                    style: TextStyle(
                      fontSize: 1.8.w,
                      height: 1.7,
                      color: Color(0xFF7E809A),
                    ),
                  ),
                ),

                Gap(2.w),

                /// STORE BUTTONS
                Row(
                  children: [
                    _storeButton(
                      icon: Icons.apple,
                      title: 'Download on the',
                      subtitle: 'App Store',
                    ),

                    const SizedBox(width: 22),

                    _storeButton(
                      icon: Icons.android,
                      title: 'GET IT ON',
                      subtitle: 'Google Play',
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 40),

          /// RIGHT PHONE MOCKUP
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                /// GLOW
                Container(
                  width: 45.w,
                  height: 45.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF8E7BFF)
                            .withOpacity(0.18),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                /// PHONE
                Container(
                  width: 320,
                  height: 650,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFF111325),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.18),
                        blurRadius: 40,
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFF7F5FF),
                          Colors.white,
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        /// TOP BAR
                        Positioned(
                          top: 16,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              width: 120,
                              height: 34,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),

                        /// CONTENT
                        Padding(
                          padding: const EdgeInsets.all(28),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 80),

                              const Text(
                                'Generate\nAmazing Art',
                                style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                  color: Color(0xFF1A1B4B),
                                ),
                              ),

                              const SizedBox(height: 28),

                              /// IMAGE CARD
                              Container(
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(32),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF8E7BFF),
                                      Color(0xFF6BE7FF),
                                    ],
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.auto_awesome,
                                    color: Colors.white,
                                    size: 90,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 28),

                              /// BUTTON
                              Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(22),
                                  gradient:
                                      const LinearGradient(
                                    colors: [
                                      Color(0xFF8E7BFF),
                                      Color(0xFF7B61FF),
                                    ],
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Create Now',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight:
                                          FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// FLOATING ICONS
                Positioned(
                  top: 40,
                  right: 30,
                  child: _floatingIcon(
                    Icons.auto_awesome,
                  ),
                ),

                Positioned(
                  bottom: 80,
                  left: 20,
                  child: _floatingIcon(
                    Icons.palette_outlined,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _storeButton({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding:  EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          spacing: 1.w,
          children: [
            Icon(
              icon,
              size: 3.w,
              color: const Color(0xFF1A1B4B),
            ),

           

            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:  TextStyle(
                    fontSize: 1.2.w,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8B8BA7),
                  ),
                ),

               

                Text(
                  subtitle,
                  style:  TextStyle(
                    fontSize: 1.5.w,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1B4B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _floatingIcon(IconData icon) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: const Color(0xFF7B61FF),
        size: 34,
      ),
    );
  }
}