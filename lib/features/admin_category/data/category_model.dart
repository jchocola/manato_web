import 'dart:convert';

class CategoryModel {
  final String id;
  final String title;
  CategoryModel({
    required this.id,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));
}
