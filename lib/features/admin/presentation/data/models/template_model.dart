import 'dart:convert';

import 'package:equatable/equatable.dart';

class TemplateModel extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final double rating;
  final int used;
  final List<String> tags;
  final Map<String, String> parameters;
  final String prompt;
  final String thumbnailImageUrl;
  final String beforeImageUrl;
  final String afterImageUrl;
  final String category;
  const TemplateModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.used,
    required this.tags,
    required this.parameters,
    required this.prompt,
    required this.thumbnailImageUrl,
    required this.beforeImageUrl,
    required this.afterImageUrl,
    required this.category
  });

  @override
  List<Object?> get props => [
    id,
    title,
    subtitle,
    rating,
    used,
    tags,
    parameters,
    prompt,
    thumbnailImageUrl,
    beforeImageUrl,
    afterImageUrl,
  ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'rating': rating,
      'used': used,
      'tags': tags,
      'parameters': parameters,
      'prompt': prompt,
      'thumbnailImageUrl': thumbnailImageUrl,
      'beforeImageUrl': beforeImageUrl,
      'afterImageUrl': afterImageUrl,
    };
  }

  factory TemplateModel.fromMap(Map<String, dynamic> map) {
    return TemplateModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      used: map['used']?.toInt() ?? 0,
      tags: List<String>.from(map['tags']),
      parameters: Map<String, String>.from(map['parameters']),
      prompt: map['prompt'] ?? '',
      thumbnailImageUrl: map['thumbnailImageUrl'] ?? '',
      beforeImageUrl: map['beforeImageUrl'] ?? '',
      afterImageUrl: map['afterImageUrl'] ?? '', category: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TemplateModel.fromJson(String source) =>
      TemplateModel.fromMap(json.decode(source));

  TemplateModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    double? rating,
    int? used,
    List<String>? tags,
    Map<String, String>? parameters,
    String? prompt,
    String? thumbnailImageUrl,
    String? beforeImageUrl,
    String? afterImageUrl,
  }) {
    return TemplateModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      rating: rating ?? this.rating,
      used: used ?? this.used,
      tags: tags ?? this.tags,
      parameters: parameters ?? this.parameters,
      prompt: prompt ?? this.prompt,
      thumbnailImageUrl: thumbnailImageUrl ?? this.thumbnailImageUrl,
      beforeImageUrl: beforeImageUrl ?? this.beforeImageUrl,
      afterImageUrl: afterImageUrl ?? this.afterImageUrl, category: '',
    );
  }
}
