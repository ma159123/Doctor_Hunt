import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final DateTime? date;
  final String? doctor;
  final String? patient;
  final bool? online;
  final String? state;
  final int? cost;
  final String? notes;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Result({
    this.date,
    this.doctor,
    this.patient,
    this.online,
    this.state,
    this.cost,
    this.notes,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        doctor: json['doctor'] as String?,
        patient: json['patient'] as String?,
        online: json['online'] as bool?,
        state: json['state'] as String?,
        cost: json['cost'] as int?,
        notes: json['notes'] as String?,
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
        'date': date?.toIso8601String(),
        'doctor': doctor,
        'patient': patient,
        'online': online,
        'state': state,
        'cost': cost,
        'notes': notes,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      date,
      doctor,
      patient,
      online,
      state,
      cost,
      notes,
      id,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
