import 'dart:io';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:manato_web/features/admin_templates/domain/storage_repository.dart';
import 'package:manato_web/main.dart';

class FirebaseStorageRepoImpl implements StorageRepository {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<void> deleteImageFromStorage(String imageUrl) {
    // TODO: implement deleteImageFromStorage
    throw UnimplementedError();
  }

  @override
  Future<String> uploadImageToStorageReturnDownloadUrl({
    required Uint8List bytes,
    String folder = 'Templates',
    required String id,
  }) async {
    try {
      final imageRef = storageRef.child(
        '$folder/$id/${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      final xFile = XFile.fromData(
        bytes,
      //  name: '${DateTime.now().millisecondsSinceEpoch}.jpg',
        mimeType: 'image/jpeg',
      );
      final uploadTask = imageRef.putData(
        await xFile.readAsBytes()
        // SettableMetadata(
        //   contentType: 'image/jpeg',
        //   customMetadata: {'size': bytes.length.toString()},
        // ),
      );
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      logger.f('Image uploaded successfully. Download URL: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      logger.e('Failed to upload image: $e');
      throw Exception('Failed to upload image: $e');
    }
  }
}
