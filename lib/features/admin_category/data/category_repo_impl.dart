import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manato_web/features/admin_category/data/category_model.dart';
import 'package:manato_web/features/admin_category/domain/category_repository.dart';
import 'package:manato_web/main.dart';

class CategoryRepoImpl implements CategoryRepository {
  CategoryRepoImpl({required this.firestoreRef});

  final CollectionReference<Map<String, dynamic>> firestoreRef;
  @override
  Future<void> createNewCategory({required CategoryModel category}) async {
    try {
      logger.i('Create category');

      if (category.id.isEmpty) {
        final docRef = await firestoreRef.add(category.toMap());
        await docRef.update({'id': docRef.id});
      } else {
        await firestoreRef.doc(category.id).set(category.toMap());
      }
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> deleteCategory({required CategoryModel category}) async {
    try {
      await firestoreRef.doc(category.id).delete();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<List<CategoryModel>> getCategoriesList() async {
    try {
      logger.i('Get category list');
      final docs = await firestoreRef.get();
      final list = docs.docs
          .map((d) => CategoryModel.fromMap(d.data()))
          .toList();
      return list;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> updateCategory({required CategoryModel category}) async {
    try {
      await firestoreRef.doc(category.id).update(category.toMap());
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
