import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final String? thumbnail;
  final String? id;
  final String? name;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Result({
    this.thumbnail,
    this.id,
    this.name,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        thumbnail: json['thumbnail'] as String?,
        id: json['_id'] as String?,
        name: json['name'] as String?,
        v: json['__v'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'thumbnail': thumbnail,
        '_id': id,
        'name': name,
        '__v': v,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      thumbnail,
      id,
      name,
      v,
      createdAt,
      updatedAt,
    ];
  }
}
