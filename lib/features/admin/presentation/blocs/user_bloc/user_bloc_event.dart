import 'package:equatable/equatable.dart';

abstract class UserBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserBlocEventLoadUser extends UserBlocEvent {}

class UserBlocEventLogin extends UserBlocEvent {
  final String email;
  final String password;
  UserBlocEventLogin({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email,password];
}

class UserBlocEventLogOut extends UserBlocEvent {}
