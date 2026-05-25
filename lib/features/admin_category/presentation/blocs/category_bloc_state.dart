import 'package:equatable/equatable.dart';

import 'package:manato_web/features/admin_category/data/category_model.dart';

abstract class CategoryBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryBlocStateInitial extends CategoryBlocState {}

class CategoryBlocStateLoading extends CategoryBlocState {}

class CategoryBlocStateLoaded extends CategoryBlocState {
  final List<CategoryModel> categoryList;
  CategoryBlocStateLoaded({
    required this.categoryList,
  });

  @override
  List<Object?> get props => [categoryList];
}

class CategoryBlocStateError extends CategoryBlocState {
  final String error;
  CategoryBlocStateError({required this.error});

  @override
  List<Object?> get props => [error];
}
