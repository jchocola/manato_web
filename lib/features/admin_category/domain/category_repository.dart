import 'package:manato_web/features/admin_category/data/category_model.dart';

abstract class CategoryRepository {
  Future<void> createNewCategory({required CategoryModel category});

  Future<void> updateCategory({required CategoryModel category});

  Future<void> deleteCategory({required CategoryModel category});

  Future<List<CategoryModel>> getCategoriesList();
}
