import 'package:equatable/equatable.dart';
import 'package:house_app/lib.dart';

abstract class LoginState extends Equatable {}

class LoginInitState implements LoginState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class LoginLoadingState implements LoginState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class LoginSuccessState implements LoginState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class LoginErrorState implements LoginState {
  final Failure failure;

  LoginErrorState({required this.failure});

  @override
  List<Object?> get props => [failure];

  @override
  bool? get stringify => true;
}
