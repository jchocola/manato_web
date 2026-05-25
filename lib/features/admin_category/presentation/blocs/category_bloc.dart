import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin_category/domain/category_repository.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc_event.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc_state.dart';
import 'package:manato_web/main.dart';

class CategoryBloc extends Bloc<CategoryBlocEvent, CategoryBlocState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository})
    : super(CategoryBlocStateInitial()) {
    on<CategoryBlocEventGetCategoryList>(_getCategoryList);
    on<CategoryBlocEventCreateCategory>(_createCategory);
  }

  Future<void> _createCategory(
    CategoryBlocEventCreateCategory event,
    Emitter<CategoryBlocState> emit,
  ) async {
    try {
      await categoryRepository.createNewCategory(category: event.category);
    } catch (e) {
      emit(CategoryBlocStateError(error: e.toString()));
    } finally {
      add(CategoryBlocEventGetCategoryList());
    }
  }

  Future<void> _getCategoryList(
    CategoryBlocEventGetCategoryList event,
    Emitter<CategoryBlocState> emit,
  ) async {
    try {
      final list = await categoryRepository.getCategoriesList();
      emit(CategoryBlocStateLoaded(categoryList: list));
    } catch (e) {
      emit(CategoryBlocStateError(error: e.toString()));
    }
  }
}
