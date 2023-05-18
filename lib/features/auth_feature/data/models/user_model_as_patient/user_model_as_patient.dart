import 'package:equatable/equatable.dart';

import 'result.dart';

class UserModelAsPatient extends Equatable {
  final String? message;
  final bool? success;
  final String? token;
  final Result? result;
  final bool? notify;

  const UserModelAsPatient({
    this.message,
    this.success,
    this.token,
    this.result,
    this.notify,
  });

  factory UserModelAsPatient.fromJson(Map<String, dynamic> json) {
    return UserModelAsPatient(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      token: json['token'] as String?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      notify: json['notify'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'success': success,
        'token': token,
        'result': result,
        'notify': notify,
      };

  @override
  List<Object?> get props => [message, success, token, result, notify];
}
