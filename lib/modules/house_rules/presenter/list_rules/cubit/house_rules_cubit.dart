import 'package:bloc/bloc.dart';
import 'package:house_app/lib.dart';

class HouseRulesCubit extends Cubit<HouseRulesState> {
  final IGetHouseRulesUseCase _getHouseRulesUseCase;
  final INavigationService _navigationService;
  final UserService _userService;
  late UserModel user;
  HouseRulesCubit(
    this._getHouseRulesUseCase,
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

  Future<void> doLogout() async {
    await _userService.userLogout();
    await _navigationService.offAllNamed(AppRoutes.login);
  }
}
