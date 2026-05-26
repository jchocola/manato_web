import 'dart:convert';

class CategoryModel {
  final String id;
  final String title;
  final String? iconStr;
  CategoryModel({required this.id, required this.title, this.iconStr});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'iconStr': iconStr};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      iconStr: map['iconStr'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  CategoryModel copyWith({String? id, String? title , String ? iconStr}) {
    return CategoryModel(id: id ?? this.id, title: title ?? this.title, iconStr: iconStr ?? this.iconStr);
  }
}
