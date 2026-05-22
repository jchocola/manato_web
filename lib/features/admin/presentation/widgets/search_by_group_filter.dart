import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class SearchByGroupFilter extends StatelessWidget {
  const SearchByGroupFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 1.w,
        children: List.generate(30, (index)=> ShadBadge.secondary(child: Text(index.toString()))),
      ),
    );
  }
}
