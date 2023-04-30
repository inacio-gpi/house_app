import 'package:house_app/lib.dart';

class LoginController {
  final INavigationService _navigationService;

  LoginController(this._navigationService);

  Future<void> doLogin() async {
    await _navigationService.toNamed(AppRoutes.houseRules);
  }
}
