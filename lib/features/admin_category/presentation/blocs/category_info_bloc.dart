import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manato_web/features/admin/presentation/data/models/template_model.dart';
import 'package:manato_web/features/admin_category/data/category_model.dart';
import 'package:manato_web/features/admin_category/domain/category_repository.dart';

///
/// EVENTS
///
abstract class CategoryInfoBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInfoBlocEventPickCategory extends CategoryInfoBlocEvent {
  final CategoryModel category;
  CategoryInfoBlocEventPickCategory({required this.category});

  @override
  List<Object?> get props => [category];
}

///
/// STATES
///
abstract class CategoryInfoBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInfoBlocStateInitial extends CategoryInfoBlocState {}

class CategoryInfoBlocStatePicked extends CategoryInfoBlocState {
  final CategoryModel category;
  final List<TemplateModel> templates;
  CategoryInfoBlocStatePicked({
    required this.category,
    this.templates = const [],
  });
}

class CategoryInfoBlocEventError extends CategoryInfoBlocState {
  final String error;
  CategoryInfoBlocEventError({required this.error});

  @override
  List<Object?> get props => [error];
}

///
/// BLOC
///
class CategoryInfoBloc
    extends Bloc<CategoryInfoBlocEvent, CategoryInfoBlocState> {
  final CategoryRepository categoryRepository;
  CategoryInfoBloc({required this.categoryRepository})
    : super(CategoryInfoBlocStateInitial()) {
    on<CategoryInfoBlocEventPickCategory>((event, emit) async {
      try {
        emit(CategoryInfoBlocStatePicked(category: event.category));
      } catch (e) {
        emit(CategoryInfoBlocEventError(error: e.toString()));
      }
    });
  }
}
