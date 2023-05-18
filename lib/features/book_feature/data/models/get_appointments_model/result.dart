import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final String? id;
  final DateTime? date;
  final String? doctor;
  final String? patient;
  final bool? online;
  final String? state;
  final int? cost;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Result({
    this.id,
    this.date,
    this.doctor,
    this.patient,
    this.online,
    this.state,
    this.cost,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['_id'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        doctor: json['doctor'] as String?,
        patient: json['patient'] as String?,
        online: json['online'] as bool?,
        state: json['state'] as String?,
        cost: json['cost'] as int?,
        v: json['__v'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'date': date?.toIso8601String(),
        'doctor': doctor,
        'patient': patient,
        'online': online,
        'state': state,
        'cost': cost,
        '__v': v,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      date,
      doctor,
      patient,
      online,
      state,
      cost,
      v,
      createdAt,
      updatedAt,
    ];
  }
}
