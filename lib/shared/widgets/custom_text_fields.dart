import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFields extends StatelessWidget {
  const CustomTextFields({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
    );
  }
}
