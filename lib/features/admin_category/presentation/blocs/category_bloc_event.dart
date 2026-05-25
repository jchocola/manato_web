import 'package:equatable/equatable.dart';

import 'package:manato_web/features/admin_category/data/category_model.dart';

abstract class CategoryBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryBlocEventCreateCategory extends CategoryBlocEvent {
  final CategoryModel category;
  CategoryBlocEventCreateCategory({required this.category});

  @override
  List<Object?> get props => [category];
}

class CategoryBlocEventDeleteCategory extends CategoryBlocEvent {
  final CategoryModel category;
  CategoryBlocEventDeleteCategory({required this.category});

  @override
  List<Object?> get props => [category];
}

class CategoryBlocEventUpdateCategory extends CategoryBlocEvent {
  final CategoryModel category;
  CategoryBlocEventUpdateCategory({required this.category});

  @override
  List<Object?> get props => [category];
}

class CategoryBlocEventGetCategoryList extends CategoryBlocEvent {

}
