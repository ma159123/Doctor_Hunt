import 'package:equatable/equatable.dart';

import 'work_hours.dart';

class Result extends Equatable {
  final WorkHours? workHours;
  final String? image;
  final String? description;
  final int? rating;
  final List<dynamic>? reviews;
  final String? title;
  final String? jobTitle;
  final int? experience;
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final int? balance;
  final int? appointmentCost;
  final String? address;
  final bool? banned;
  final int? phone;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Result({
    this.workHours,
    this.image,
    this.description,
    this.rating,
    this.reviews,
    this.title,
    this.jobTitle,
    this.experience,
    this.id,
    this.name,
    this.email,
    this.password,
    this.balance,
    this.appointmentCost,
    this.address,
    this.banned,
    this.phone,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        workHours: json['workHours'] == null
            ? null
            : WorkHours.fromJson(json['workHours'] as Map<String, dynamic>),
        image: json['image'] as String?,
        description: json['description'] as String?,
        rating: json['rating'] as int?,
        reviews: json['reviews'] as List<dynamic>?,
        title: json['title'] as String?,
        jobTitle: json['jobTitle'] as String?,
        experience: json['experience'] as int?,
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        balance: json['balance'] as int?,
        appointmentCost: json['AppointmentCost'] as int?,
        address: json['address'] as String?,
        banned: json['banned'] as bool?,
        phone: json['phone'] as int?,
        v: json['__v'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'workHours': workHours?.toJson(),
        'image': image,
        'description': description,
        'rating': rating,
        'reviews': reviews,
        'title': title,
        'jobTitle': jobTitle,
        'experience': experience,
        '_id': id,
        'name': name,
        'email': email,
        'password': password,
        'balance': balance,
        'AppointmentCost': appointmentCost,
        'address': address,
        'banned': banned,
        'phone': phone,
        '__v': v,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      workHours,
      image,
      description,
      rating,
      reviews,
      title,
      jobTitle,
      experience,
      id,
      name,
      email,
      password,
      balance,
      appointmentCost,
      address,
      banned,
      phone,
      v,
      createdAt,
      updatedAt,
    ];
  }
}
