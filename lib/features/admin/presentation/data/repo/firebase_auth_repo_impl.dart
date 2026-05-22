import 'package:firebase_auth/firebase_auth.dart';
import 'package:manato_web/features/admin/presentation/domain/auth_repository.dart';
import 'package:manato_web/main.dart';

class FirebaseAuthRepoImpl implements AuthRepository {
  final firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User?> getCurrentUser() async {
    try {
      return firebaseAuth.currentUser;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<UserCredential> logIn({
    required String email,
    required String password,
  }) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
