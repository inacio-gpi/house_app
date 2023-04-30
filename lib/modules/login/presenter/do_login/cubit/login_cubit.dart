import 'package:bloc/bloc.dart';
import 'package:house_app/lib.dart';

class LoginCubit extends Cubit<LoginState> {
  final IDoLoginUseCase _doLoginUseCase;
  final INavigationService _navigationService;

  LoginCubit(
    this._doLoginUseCase,
    this._navigationService,
  ) : super(LoginInitState());

  Future<void> doLogin({required String name}) async {
    emit(LoginLoadingState());
    final result = await _doLoginUseCase(name: name);
    result.fold(
      (final l) {
        emit(LoginErrorState(failure: l));
      },
      (final r) {
        _navigationService.offAllNamed(AppRoutes.houseRules);
      },
    );
  }

  Future<void> doLogout() async {
    await _navigationService.offAllNamed(AppRoutes.login);
  }
}
