import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc_event.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc_state.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_info_bloc.dart';
import 'package:manato_web/features/admin_category/presentation/pages/edit_category_modal.dart';
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
              crossAxisCount: 2,
              childAspectRatio: 3 / 1,
            ),
            itemBuilder: (context, index) => CategoryCard(
              category: state.categoryList[index],
              onDeletePressed: () => context.read<CategoryBloc>().add(
                CategoryBlocEventDeleteCategory(
                  category: state.categoryList[index],
                ),
              ),
              onEditPressed: () {
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  builder: (context) =>
                      EditCategoryModal(category: state.categoryList[index]),
                );
              },
              onTap: () {
                context.read<CategoryInfoBloc>().add(
                  CategoryInfoBlocEventPickCategory(
                    category: state.categoryList[index],
                  ),
                );
                context.go('/category/category_detail');
              },
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
