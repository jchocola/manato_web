import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manato_web/features/admin_category/data/category_model.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc_event.dart';
import 'package:manato_web/shared/widgets/custom_input.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class EditCategoryModal extends StatefulWidget {
  const EditCategoryModal({super.key, required this.category});
  final CategoryModel category;
  @override
  State<EditCategoryModal> createState() => _EditCategoryModalState();
}

class _EditCategoryModalState extends State<EditCategoryModal> {
  late TextEditingController categoryTitleController;

  late TextEditingController iconStrController;
  @override
  void initState() {
    super.initState();

    categoryTitleController = TextEditingController(
      text: widget.category.title,
    );
    iconStrController = TextEditingController(text: widget.category.iconStr);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Column(
        spacing: 1.w,
        crossAxisAlignment: .start,
        children: [
          CustomInput(
            title: 'Category title',
            controller: categoryTitleController,
          ),

           CustomInput(
            title: 'Icon Str',
            controller: iconStrController,
          ),

          Text('ID :' + widget.category.id),

          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              ShadButton.ghost(
                child: Text('Cancel'),
                onPressed: () {
                  context.pop();
                },
              ),
              ShadButton.destructive(
                child: Text('Confirm'),
                onPressed: () {
                  context.read<CategoryBloc>().add(
                    CategoryBlocEventUpdateCategory(
                      category: widget.category.copyWith(
                        title: categoryTitleController.text,
                        iconStr: iconStrController.text
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
