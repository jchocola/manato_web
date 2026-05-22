import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> getCurrentUser();
  Future<UserCredential> logIn({
    required String email,
    required String password,
  });

  Future<void> logOut();
}
