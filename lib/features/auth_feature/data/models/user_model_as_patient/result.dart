import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final int? balance;
  final bool? banned;
  final String? image;
  final List<dynamic>? favoriteDoctors;
  final List<dynamic>? medicalRecords;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final DateTime? dateOfBirth;

  const Result({
    this.id,
    this.name,
    this.email,
    this.password,
    this.balance,
    this.banned,
    this.image,
    this.favoriteDoctors,
    this.medicalRecords,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.dateOfBirth,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        balance: json['balance'] as int?,
        banned: json['banned'] as bool?,
        image: json['image'] as String?,
        favoriteDoctors: json['favoriteDoctors'] as List<dynamic>?,
        medicalRecords: json['medicalRecords'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        dateOfBirth: json['DateOfBirth'] == null
            ? null
            : DateTime.parse(json['DateOfBirth'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'password': password,
        'balance': balance,
        'banned': banned,
        'image': image,
        'favoriteDoctors': favoriteDoctors,
        'medicalRecords': medicalRecords,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'DateOfBirth': dateOfBirth?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      password,
      balance,
      banned,
      image,
      favoriteDoctors,
      medicalRecords,
      createdAt,
      updatedAt,
      v,
      dateOfBirth,
    ];
  }
}
