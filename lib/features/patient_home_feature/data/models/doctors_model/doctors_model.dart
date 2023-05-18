import 'package:equatable/equatable.dart';

import 'result.dart';

class DoctorsModel extends Equatable {
  final String? message;
  final bool? success;
  final List<Result>? results;
  final int? total;
  final bool? notify;

  const DoctorsModel({
    this.message,
    this.success,
    this.results,
    this.total,
    this.notify,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) => DoctorsModel(
        message: json['message'] as String?,
        success: json['success'] as bool?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
        notify: json['notify'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'success': success,
        'results': results?.map((e) => e.toJson()).toList(),
        'total': total,
        'notify': notify,
      };

  @override
  List<Object?> get props => [message, success, results, total, notify];
}
