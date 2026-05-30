import 'dart:io';



abstract class StorageRepository {
  Future<String> uploadImageToStorageReturnDownloadUrl({
   required File imageFile,
    String folder = 'Templates',
    required String id,
  });

  Future<void> deleteImageFromStorage(String imageUrl);
}
