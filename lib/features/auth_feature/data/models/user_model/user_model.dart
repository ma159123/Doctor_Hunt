import 'package:equatable/equatable.dart';

import 'result.dart';

class UserModel extends Equatable {
  final String? message;
  final bool? success;
  final String? token;
  final List<Result>? results;
  final bool? notify;

  const UserModel({
    this.message,
    this.success,
    this.token,
    this.results,
    this.notify,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json['message'] as String?,
        success: json['success'] as bool?,
        token: json['token'] as String?,
        results: (json['result'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
        notify: json['notify'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'success': success,
        'token': token,
        'result': results?.map((e) => e.toJson()).toList(),
        'notify': notify,
      };

  @override
  List<Object?> get props => [message, success, token, results, notify];
}
