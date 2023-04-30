import 'package:bloc/bloc.dart';
import 'package:house_app/lib.dart';

class HouseRulesCubit extends Cubit<HouseRulesState> {
  final IGetHouseRulesUseCase _getHouseRulesUseCase;
  final INavigationService _navigationService;

  HouseRulesCubit(
    this._getHouseRulesUseCase,
    this._navigationService,
  ) : super(InitialState());

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
    await _navigationService.offAllNamed(AppRoutes.login);
  }
}
