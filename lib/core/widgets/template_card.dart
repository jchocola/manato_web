import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:manato_web/core/constants/app_icons.dart';
import 'package:sizer/sizer.dart';

class FantasyTemplateCard extends StatelessWidget {
  

  const FantasyTemplateCard({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20.w,
        height: 15.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.w),
         
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Stack(
            children: [
              /// BACKGROUND IMAGE
              Positioned.fill(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU0JPpp6RLgZ61N9PDi963ryb424zMmI8e_A&s',
                  fit: BoxFit.cover,
                  //height: 25.h,
                ),
              ),
      
              /// PINK OVERLAY
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.pink.withOpacity(0.15)],
                    ),
                  ),
                ),
              ),
      
            //  Positioned(top: 3.w, left: 3.w, child: TemplateTag()),
      
              /// HEART BUTTON
              // Positioned(
              //   top: 1.w,
              //   right: 1.w,
              //   child: Transform.scale(
              //     scale: 0.7,
              //     child: IconButton(
              //       color: AppColors.primary,
              //       //focusColor: Colors.white,
              //       onPressed: () {},
              //       icon: Icon(Icons.favorite_rounded),
              //     ),
              //   ),
              // ),
      
              /// GLASS PANEL
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius:  BorderRadius.vertical(
                    top: Radius.circular(1.w),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                    child: Container(
                      padding: EdgeInsets.all(1.5.w),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface.withOpacity(0.18),
                        border: Border(
                          top: BorderSide(color: theme.colorScheme.surface.withOpacity(0.35)),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 1.w,
                        children: [
                          /// TITLE
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text('Fairy Tale', style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.surface , fontSize: 1.3.w)),
      
                               Text('⭐️ 3.5', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.surface, fontSize: 1.7.w)),
                            
                            ],
                          ),
      
                          /// SUBTITLE
                          Row(
                            children: [
                               Text('#ierer43', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.surface , fontSize: 1.3.w)),
                              Spacer(),
      
                              /// USERS
                              Row(
                                  spacing: 0.5.w,
                                children: [
                                  Icon(AppIcons.favourite, size: 2.w, color: theme.colorScheme.surface,),
      
                                  Text('12.3K', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.surface , fontSize: 1.3.w)),
                                ],
                              ),
                            ],
                          ),
      
                                        
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      
              /// SOFT BORDER
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: theme.colorScheme.surface.withOpacity(0.45),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}