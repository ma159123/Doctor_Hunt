import 'package:equatable/equatable.dart';

class WorkHours extends Equatable {
  final int? from;
  final int? to;

  const WorkHours({this.from, this.to});

  factory WorkHours.fromJson(Map<String, dynamic> json) => WorkHours(
        from: json['from'] as int?,
        to: json['to'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
      };

  @override
  List<Object?> get props => [from, to];
}
