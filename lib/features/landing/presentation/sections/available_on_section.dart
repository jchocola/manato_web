import 'package:flutter/material.dart';

class AvailableOnStoresSection extends StatelessWidget {
  const AvailableOnStoresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
    
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
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
                  child: const Text(
                    'Available on Mobile',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7B61FF),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// TITLE
                const Text(
                  'Create AI Images Anywhere',
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                    color: Color(0xFF1A1B4B),
                  ),
                ),

                const SizedBox(height: 24),

                /// DESCRIPTION
                const SizedBox(
                  width: 600,
                  child: Text(
                    'Download Manato on iOS and Android to generate stunning AI art anytime, anywhere. Fast, secure, and built for creators.',
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.7,
                      color: Color(0xFF7E809A),
                    ),
                  ),
                ),

                const SizedBox(height: 42),

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
                  width: 500,
                  height: 500,
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
        padding: const EdgeInsets.symmetric(
          horizontal: 26,
          vertical: 18,
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
          children: [
            Icon(
              icon,
              size: 38,
              color: const Color(0xFF1A1B4B),
            ),

            const SizedBox(width: 16),

            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8B8BA7),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 22,
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