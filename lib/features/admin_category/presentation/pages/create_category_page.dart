import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin_category/data/category_model.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc_event.dart';
import 'package:manato_web/shared/widgets/custom_input.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class CreateCategoryPage extends StatefulWidget {
  const CreateCategoryPage({super.key});

  @override
  State<CreateCategoryPage> createState() => _CreateCategoryPageState();
}

class _CreateCategoryPageState extends State<CreateCategoryPage> {
  final categoryTitleController = TextEditingController();
  final categoryIDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Column(
        spacing: 1.w,
        children: [
          CustomInput(
            title: 'Category name',
            controller: categoryTitleController,
          ),
          CustomInput(title: 'Category ID', controller: categoryIDController),
          ShadButton(
            child: Text('Create'),
            onPressed: () {
              final CategoryModel model = CategoryModel(
                id: categoryIDController.text,
                title: categoryTitleController.text,
              );

              context.read<CategoryBloc>().add(
                CategoryBlocEventCreateCategory(category: model),
              );
            },
          ),
        ],
      ),
    );
  }
}
