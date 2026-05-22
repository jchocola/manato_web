import 'package:flutter/material.dart';

void showCustomSnackbar(BuildContext context, {required String title}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
