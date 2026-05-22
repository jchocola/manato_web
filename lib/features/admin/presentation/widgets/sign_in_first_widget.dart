import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manato_web/shared/widgets/custom_text_fields.dart';
import 'package:sizer/sizer.dart';

class SignInFirstWidget extends StatelessWidget {
  const SignInFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.w,
      height: 50.h,
      child: Card(
        child: Padding(
          padding: .all(2.w),
          child: Column(
            mainAxisSize: .min,
            children: [
              Text('Please sign in first'),
              Flexible(child: CustomTextFields()),
              Flexible(child: CustomTextFields()),
              ElevatedButton(onPressed: () {}, child: Text('Sign In')),
            ],
          ),
        ),
      ),
    );
  }
}
