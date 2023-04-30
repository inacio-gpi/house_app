import 'package:house_app/lib.dart';

abstract class ILoginLocalDataSource {
  Future<UserModel> doLogin({required String name});
}

class LoginLocalDataSource extends ILoginLocalDataSource {
  final ILocalStorage _localStorage;
  LoginLocalDataSource(this._localStorage);

  @override
  Future<UserModel> doLogin({required String name}) async {
    final user = UserModel(
      name: name,
      token: '40fe071962846075452a4f6123ae71697463cad20f51e237e2035b41af0513d8',
    );
    await _localStorage.saveData(CACHED_USER, user.toJson());
    return user;
  }
}
