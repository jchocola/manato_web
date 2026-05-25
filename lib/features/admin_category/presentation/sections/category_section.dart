import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc_event.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc_state.dart';
import 'package:manato_web/shared/widgets/category_card.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryBlocState>(
      builder: (context, state) {
        if (state is CategoryBlocStateLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: state.categoryList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 1,
            ),
            itemBuilder: (context, index) => CategoryCard(),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
