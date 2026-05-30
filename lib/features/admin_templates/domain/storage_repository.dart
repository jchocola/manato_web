import 'dart:io';

import 'package:flutter/services.dart';



abstract class StorageRepository {
  Future<String> uploadImageToStorageReturnDownloadUrl({
    required Uint8List bytes,
    String folder = 'Templates',
    required String id,
  });

  Future<void> deleteImageFromStorage(String imageUrl);
}
