import 'package:equatable/equatable.dart';

import 'work_hours.dart';

class Result extends Equatable {
  final WorkHours? workHours;
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final int? balance;
  final int? appointmentCost;
  final bool? banned;
  final String? image;
  final String? description;
  final int? rating;
  final List<dynamic>? reviews;
  final String? title;
  final String? jobTitle;
  final int? experience;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? address;
  final String? category;
  final int? phone;

  const Result({
    this.workHours,
    this.id,
    this.name,
    this.email,
    this.password,
    this.balance,
    this.appointmentCost,
    this.banned,
    this.image,
    this.description,
    this.rating,
    this.reviews,
    this.title,
    this.jobTitle,
    this.experience,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.address,
    this.category,
    this.phone,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        workHours: json['workHours'] == null
            ? null
            : WorkHours.fromJson(json['workHours'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        balance: json['balance'] as int?,
        appointmentCost: json['AppointmentCost'] as int?,
        banned: json['banned'] as bool?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        rating: json['rating'] as int?,
        reviews: json['reviews'] as List<dynamic>?,
        title: json['title'] as String?,
        jobTitle: json['jobTitle'] as String?,
        experience: json['experience'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        address: json['address'] as String?,
        category: json['category'] as String?,
        phone: json['phone'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'workHours': workHours?.toJson(),
        '_id': id,
        'name': name,
        'email': email,
        'password': password,
        'balance': balance,
        'AppointmentCost': appointmentCost,
        'banned': banned,
        'image': image,
        'description': description,
        'rating': rating,
        'reviews': reviews,
        'title': title,
        'jobTitle': jobTitle,
        'experience': experience,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'address': address,
        'category': category,
        'phone': phone,
      };

  @override
  List<Object?> get props {
    return [
      workHours,
      id,
      name,
      email,
      password,
      balance,
      appointmentCost,
      banned,
      image,
      description,
      rating,
      reviews,
      title,
      jobTitle,
      experience,
      createdAt,
      updatedAt,
      v,
      address,
      category,
      phone,
    ];
  }
}
