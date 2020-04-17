import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;

  Failure([
    this.properties = const <dynamic>[],
  ]);

  List<Object> get props => [properties];
}

// General Failures
class ServerFailure extends Failure {}

class UnknownFailure extends Failure {}