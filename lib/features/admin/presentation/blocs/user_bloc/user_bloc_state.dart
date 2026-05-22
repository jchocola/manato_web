import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:manato_web/features/admin/presentation/data/models/user_model.dart';

abstract class UserBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserBlocStateUnauthenticated extends UserBlocState {}

class UserBlocStateAuthenticated extends UserBlocState {
  final User user;
  final UserModel userModel;
  UserBlocStateAuthenticated({required this.user, required this.userModel});

  @override
  List<Object?> get props => [user, userModel];
}

class UserBlocStateError extends UserBlocState {
  final String error;
  UserBlocStateError({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
