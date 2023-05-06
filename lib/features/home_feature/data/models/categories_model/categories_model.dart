import 'package:equatable/equatable.dart';

import 'result.dart';

class CategoriesModel extends Equatable {
  final String? message;
  final bool? success;
  final List<Result>? results;
  final int? total;
  final bool? notify;

  const CategoriesModel({
    this.message,
    this.success,
    this.results,
    this.total,
    this.notify,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      notify: json['notify'] as bool?,
    );
  }

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
