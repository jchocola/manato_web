import 'package:manato_web/features/admin_tag/data/tag_model.dart';

abstract class TagRepository {
  Future<void> createTag({required TagModel tag});
  Future<void> updateTag({required TagModel tag});
  Future<void> deleteTag({required TagModel tag});
  Future<List<TagModel>> getTagList();
}
