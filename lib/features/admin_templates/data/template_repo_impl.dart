import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manato_web/features/admin/presentation/data/models/template_model.dart';
import 'package:manato_web/features/admin_templates/domain/template_repository.dart';
import 'package:manato_web/main.dart';

class TemplateRepoImpl implements TemplateRepository {
  final CollectionReference<Map<String, dynamic>> templateRef;

  TemplateRepoImpl({required this.templateRef});

  @override
  Future<void> activateTemplate({required TemplateModel model}) async {
    try {
      final updatedTemplate = model.copyWith(visibility: true);

      await updateTemplate(model: updatedTemplate);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> createTemplate({required TemplateModel model}) async {
    try {
      await templateRef.doc(model.id).set(model.toMap());
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> deactivateTemplate({required TemplateModel model}) async {
    try {
      final updatedTemplate = model.copyWith(visibility: false);

      await updateTemplate(model: updatedTemplate);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> deleteTemplate({required TemplateModel model}) async {
    try {
      await templateRef.doc(model.id).delete();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<List<TemplateModel>> getActivatedTempalates() async {
    try {
      final allList = await getAllTempalates();

      final activatedList = allList
          .where((template) => template.visibility == true)
          .toList();

      return activatedList;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<List<TemplateModel>> getAllTempalates() async {
    try {
      final docs = await templateRef.get();

      final list = docs.docs
          .map((e) => TemplateModel.fromMap(e.data()))
          .toList();

      return list;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<List<TemplateModel>> getDeactivatedTempalates() async {
    try {
      final allList = await getAllTempalates();

      final deactivatedList = allList
          .where((template) => template.visibility == false)
          .toList();

      return deactivatedList;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> updateTemplate({required TemplateModel model}) async {
    try {
      await templateRef.doc(model.id).update(model.toMap());
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
