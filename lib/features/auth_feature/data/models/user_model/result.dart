import 'package:equatable/equatable.dart';

import 'work_hours.dart';

class Result extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final int? balance;
  final int? appointmentCost;
  final WorkHours? workHours;
  final bool? banned;
  final String? image;
  final String? description;
  final int? rating;
  final List<dynamic>? reviews;
  final String? title;
  final String? jobTitle;
  final int? experience;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Result({
    this.name,
    this.email,
    this.password,
    this.balance,
    this.appointmentCost,
    this.workHours,
    this.banned,
    this.image,
    this.description,
    this.rating,
    this.reviews,
    this.title,
    this.jobTitle,
    this.experience,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        balance: json['balance'] as int?,
        appointmentCost: json['AppointmentCost'] as int?,
        workHours: json['workHours'] == null
            ? null
            : WorkHours.fromJson(json['workHours'] as Map<String, dynamic>),
        banned: json['banned'] as bool?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        rating: json['rating'] as int?,
        reviews: json['reviews'] as List<dynamic>?,
        title: json['title'] as String?,
        jobTitle: json['jobTitle'] as String?,
        experience: json['experience'] as int?,
        id: json['_id'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'balance': balance,
        'AppointmentCost': appointmentCost,
        'workHours': workHours?.toJson(),
        'banned': banned,
        'image': image,
        'description': description,
        'rating': rating,
        'reviews': reviews,
        'title': title,
        'jobTitle': jobTitle,
        'experience': experience,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      name,
      email,
      password,
      balance,
      appointmentCost,
      workHours,
      banned,
      image,
      description,
      rating,
      reviews,
      title,
      jobTitle,
      experience,
      id,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
