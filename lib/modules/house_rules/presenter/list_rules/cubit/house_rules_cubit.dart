import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:house_app/lib.dart';
import 'package:house_app/modules/house_rules/presenter/components/create_rule_dialog.dart';

class HouseRulesCubit extends Cubit<HouseRulesState> {
  final IGetHouseRulesUseCase _getHouseRulesUseCase;
  final ICreateHouseRuleUseCase _createHouseRuleUseCase;
  final INavigationService _navigationService;
  final UserService _userService;
  late UserModel user;
  HouseRulesCubit(
    this._getHouseRulesUseCase,
    this._createHouseRuleUseCase,
    this._navigationService,
    this._userService,
  ) : super(InitialState()) {
    user = _userService.currentUser;
  }

  Future<void> getHouseRules([String? linkUrl]) async {
    emit(LoadingState());
    final result = await _getHouseRulesUseCase(linkUrl);
    result.fold(
      (final l) {
        emit(ErrorState(failure: l));
      },
      (final r) {
        emit(SuccessState(houseRules: r));
      },
    );
  }

  Future<void> openCreateRule(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) => const CreateRulesDialog(),
    );
    if (result != null) {
      await _createHouseRuleUseCase(result);
    }
  }

  Future<void> doLogout() async {
    await _userService.userLogout();
    await _navigationService.offAllNamed(AppRoutes.login);
  }
}
