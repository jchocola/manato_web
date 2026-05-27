import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_info_bloc.dart';
import 'package:manato_web/shared/widgets/category_listile.dart';
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
                   
                  Text('${state.category.iconStr}  ${state.category.title}' , style: TextStyle(fontSize: 2.w)),
                  Text(state.category.id, style: TextStyle(fontSize: 1.5.w)),
                ],
              ),
              actions: [Text('${state.templates.length} templates')],
            ),
            body: webBody(context),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget webBody(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(2.w),
      child: SingleChildScrollView(
        child: Column(children: [
          _buildTemplateWithCurrentCategory(),
          ],
        ),
      ),
    );
  }
}

class _buildTemplateWithCurrentCategory extends StatelessWidget {
  const _buildTemplateWithCurrentCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3/1
      ),
      itemBuilder: (context, index) => TemplateListile(),
    );
  }
}
