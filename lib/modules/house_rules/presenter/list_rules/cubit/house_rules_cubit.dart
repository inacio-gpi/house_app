import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:house_app/lib.dart';

class HouseRulesCubit extends Cubit<HouseRulesState> {
  final IGetHouseRulesUseCase _getHouseRulesUseCase;
  final ICreateHouseRuleUseCase _createHouseRuleUseCase;
  final IUpdateRuleUseCase _updateRuleUseCase;
  final INavigationService _navigationService;
  final UserService _userService;
  late UserModel user;
  HouseRulesCubit(
    this._getHouseRulesUseCase,
    this._createHouseRuleUseCase,
    this._updateRuleUseCase,
    this._navigationService,
    this._userService,
  ) : super(InitialState()) {
    user = _userService.currentUser;
  }

  late HouseRulesEntity houseRules;

  bool get hasBottomPagination => houseRules.pagination.totalPages >= 2;
  bool get isValidBackButton => houseRules.pagination.currentPage >= 2;
  bool get isValidNextButton => houseRules.pagination.totalPages > houseRules.pagination.currentPage;

  Future<void> nextPage() async {
    if (isValidNextButton) {
      await getHouseRules(houseRules.pagination.links.next);
    }
  }

  Future<void> backPage() async {
    if (isValidBackButton) {
      await getHouseRules(houseRules.pagination.links.prev);
    }
  }

  Future<void> getHouseRules([String? linkUrl]) async {
    emit(LoadingState());
    final result = await _getHouseRulesUseCase(linkUrl);
    result.fold(
      (final l) {
        emit(ErrorState(failure: l));
      },
      (final r) {
        houseRules = r;
        emit(SuccessState(houseRules: r));
      },
    );
  }

  Future<void> openCreateRule(BuildContext context) async {
    final ruleEntity = await showDialog(
      context: context,
      builder: (context) => const CreateRulesDialog(
        titleDialog: 'New rule:',
      ),
    );
    if (ruleEntity != null) {
      final result = await _createHouseRuleUseCase(ruleEntity);
      result.fold(
        (final l) {
          emit(ErrorState(failure: l));
        },
        (final r) {
          getHouseRules();
        },
      );
    }
  }

  Future<void> openUpdateRule(BuildContext context, {required EntitiesEntity rule}) async {
    final ruleEntity = await showDialog(
      context: context,
      builder: (context) => CreateRulesDialog(
        titleDialog: 'Update rule:',
        rule: rule,
      ),
    );
    if (ruleEntity != null) {
      final result = await _updateRuleUseCase(ruleEntity);
      result.fold(
        (final l) {
          emit(ErrorState(failure: l));
        },
        (final r) {
          getHouseRules();
        },
      );
    }
  }

  Future<void> doLogout() async {
    await _userService.userLogout();
    await _navigationService.offAllNamed(AppRoutes.login);
  }
}
