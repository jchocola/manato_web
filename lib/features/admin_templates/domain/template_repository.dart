import 'package:manato_web/features/admin/presentation/data/models/template_model.dart';

abstract class TemplateRepository {
  Future<void> createTemplate({required TemplateModel model});
  Future<void> activateTemplate({required TemplateModel model});
  Future<void> deactivateTemplate({required TemplateModel model});
  Future<void> deleteTemplate({required TemplateModel model});
  Future<void> updateTemplate({required TemplateModel model});
  Future<List<TemplateModel>> getAllTempalates();
  Future<List<TemplateModel>> getActivatedTempalates();
  Future<List<TemplateModel>> getDeactivatedTempalates();
}
