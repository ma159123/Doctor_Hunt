import 'package:equatable/equatable.dart';

class AvailableAppointments extends Equatable {
  final String? message;
  final bool? success;
  final List<DateTime>? results;
  final bool? notify;

  const AvailableAppointments({
    this.message,
    this.success,
    this.results,
    this.notify,
  });

  factory AvailableAppointments.fromJson(Map<String, dynamic> json) {
    return AvailableAppointments(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
      notify: json['notify'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'success': success,
        'results': results?.map((e) => e.toIso8601String()).toList(),
        'notify': notify,
      };

  @override
  List<Object?> get props => [message, success, results, notify];
}
