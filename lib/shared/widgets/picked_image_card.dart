import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class PickedImageCard extends StatelessWidget {
  const PickedImageCard({super.key , this.pickedImage, this.onPressed});
  final File? pickedImage;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ShadCard(width: 25.w, height: 25.h ,
      child: pickedImage != null 
        ? Image.file(pickedImage!, fit: BoxFit.cover,)
        : Center(child: ShadIconButton(
          onPressed: onPressed,
          icon: Icon(Icons.add_a_photo_rounded, size: 3.w) ,)),
    );
  }
}
