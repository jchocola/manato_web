import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_info_bloc.dart';
import 'package:sizer/sizer.dart';

class CategoryDetailPage extends StatelessWidget {
  const CategoryDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryInfoBloc, CategoryInfoBlocState>(
      builder: (context, state) {
        if (state is CategoryInfoBlocStatePicked) {
          return Scaffold(
            appBar: AppBar(
              title: Column(
                mainAxisSize: .min,
                children: [
                  Text(state.category.title , style: TextStyle(fontSize: 2.w),),
                  Text(state.category.id , style: TextStyle(fontSize: 1.5.w)), 
                ],
              ),
              actions: [
                Text('${state.templates.length} templates')
              ],
              ),
            );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
