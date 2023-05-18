import 'package:equatable/equatable.dart';

import 'result.dart';

class AppointmentModel extends Equatable {
  final String? message;
  final bool? success;
  final Result? result;
  final bool? notify;

  const AppointmentModel({
    this.message,
    this.success,
    this.result,
    this.notify,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      notify: json['notify'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'success': success,
        'result': result?.toJson(),
        'notify': notify,
      };

  @override
  List<Object?> get props => [message, success, result, notify];
}
