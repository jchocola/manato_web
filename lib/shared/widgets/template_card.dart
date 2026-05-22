import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class TemplateCard extends StatelessWidget {
  const TemplateCard({super.key, this.onTap});
   final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: onTap,
      child: ShadCard(
        padding: EdgeInsets.all(1.w),
        child: Column(
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlhrCmPbw6iL1qMKM_1_kXM4CequV1AlfFzQ&s',
              width: 15.w,
              height: 15.w,
              fit: .cover,
            ),
      
            Column(
              crossAxisAlignment: .start,
              children: [
                Text('Name'),
                Text('#sfhs'),
                Row(
                  children: [
                    ShadButton.ghost(
                      leading: Icon(Icons.favorite),
                      child: Text('34.65'),
                    ),
                    ShadButton.ghost(
                      leading: Icon(Icons.star),
                      child: Text('34k'),
                    ),
                  ],
                ),
      
      
                ShadSwitch(value: true , label: Text('Activity'), height: 1.h, width: 4.w,),
                Wrap(
                  spacing: 1.w,
                  children: List.generate(5, (index)=> ShadBadge.outline(child: Text(index.toString()))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
