import 'dart:convert';

import 'package:equatable/equatable.dart';

enum Role { user, admin }

class UserModel extends Equatable {
  final String id;
  final Role role;
  const UserModel({required this.id, required this.role});
  @override
  List<Object?> get props => [id, role];

  Map<String, dynamic> toMap() {
    return {'id': id, 'role': role.toString()};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      role: roleStringConverter(map['role']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

Role roleStringConverter(String str) {
  switch (str) {
    case "Role.user":
      return Role.user;
    case "Role.admin":
      return Role.admin;
    default:
      return Role.admin;
  }
}
