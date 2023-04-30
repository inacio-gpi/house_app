import 'package:equatable/equatable.dart';
import 'package:house_app/lib.dart';

abstract class HouseRulesState extends Equatable {}

class InitialState implements HouseRulesState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class LoadingState implements HouseRulesState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class SuccessState implements HouseRulesState {
  final HouseRulesEntity houseRules;

  SuccessState({required this.houseRules});

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class ErrorState implements HouseRulesState {
  final Failure failure;

  ErrorState({required this.failure});

  @override
  List<Object?> get props => [failure];

  @override
  bool? get stringify => true;
}
