import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Failure extends Equatable {
  final String message;
  final StackTrace? stackTrace;
  final String? label;

  Failure({required this.message, this.stackTrace, this.label}) {
    if (stackTrace != null) {
      debugPrintStack(stackTrace: stackTrace, label: label);
    }
  }

  @override
  String toString() => '$runtimeType: $message';
}

class DataSourceException extends Failure {
  DataSourceException({
    required final String message,
    final StackTrace? stackTrace,
    final String? label,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          label: label,
        );

  @override
  List<Object?> get props => [message, stackTrace, label];
}

class NetworkException extends Failure {
  final dynamic data;
  NetworkException({
    required final String message,
    final StackTrace? stackTrace,
    final String? label,
    this.data,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          label: label,
        );
  @override
  List<Object?> get props => [message, stackTrace, label, data];
}
