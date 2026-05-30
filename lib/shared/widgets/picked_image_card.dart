import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class PickedImageCard extends StatelessWidget {
  const PickedImageCard({
    super.key,
    this.pickedImage,
    this.onPressed,
    this.title = '',this.onDoubleTap,
  });
  final Uint8List? pickedImage;
  final void Function()? onPressed;
  final String title;
  final void Function()? onDoubleTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 1.w,
      children: [
        Text(title),
        ShadCard(
          width: 25.w,
          height: 25.h,
          child: pickedImage != null
              ? GestureDetector(
                onDoubleTap: onDoubleTap,
                child: Image.memory(pickedImage!, fit: BoxFit.cover))
              : Center(
                  child: ShadIconButton(
                    onPressed: onPressed,
                    icon: Icon(Icons.add_a_photo_rounded, size: 3.w),
                  ),
                ),
        ),
      ],
    );
  }
}



