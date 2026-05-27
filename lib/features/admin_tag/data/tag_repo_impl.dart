import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manato_web/features/admin_tag/data/tag_model.dart';
import 'package:manato_web/features/admin_tag/domain/tag_repository.dart';
import 'package:manato_web/main.dart';

class TagRepoImpl implements TagRepository {
  final CollectionReference<Map<String, dynamic>> tagStoreRef;

  TagRepoImpl({required this.tagStoreRef});

  @override
  Future<void> createTag({required TagModel tag}) async {
    try {
      await tagStoreRef.doc(tag.id).set(tag.toMap());
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> deleteTag({required TagModel tag}) async {
    try {
      await tagStoreRef.doc(tag.id).delete();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<List<TagModel>> getTagList() async {
    try {
      final snapshots = await tagStoreRef.get();

      final list = snapshots.docs
          .map((doc) => TagModel.fromMap(doc.data()))
          .toList();

      return list;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> updateTag({required TagModel tag}) async {
    try {
      await tagStoreRef.doc(tag.id).update(tag.toMap());
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
