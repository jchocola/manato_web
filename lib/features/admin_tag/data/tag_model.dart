import 'dart:convert';

class TagModel {
  final String title;
  final String id;
  TagModel({
    required this.title,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
    };
  }

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(
      title: map['title'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TagModel.fromJson(String source) => TagModel.fromMap(json.decode(source));

  TagModel copyWith({
    String? title,
    String? id,
  }) {
    return TagModel(
      title: title ?? this.title,
      id: id ?? this.id,
    );
  }
}
