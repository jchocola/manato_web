import 'package:flutter/widgets.dart';
import 'package:manato_web/shared/widgets/category_card.dart';

class TagSection extends StatelessWidget {
  const TagSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3/1
      ),
      itemBuilder: (context, index) => CategoryCard(),
    );
  }
}
