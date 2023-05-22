import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String error;

  Failure(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class OfflineFailure extends Failure {
  OfflineFailure(super.error);

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure(super.error);

  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure(super.error);

  @override
  List<Object?> get props => [];
}
