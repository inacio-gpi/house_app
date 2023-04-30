import 'package:house_app/lib.dart';

abstract class ILoginLocalDataSource {
  Future<void> doLogin({required String name});
}

class LoginLocalDataSource extends ILoginLocalDataSource {
  static const String CACHED_USER = 'CACHED_USER';

  LoginLocalDataSource(this._localStorage);
  final LocalStorage _localStorage;

  @override
  Future<void> doLogin({required String name}) async {
    await _localStorage.saveData(
      CACHED_USER,
      UserModel(
        name: name,
        token: '40fe071962846075452a4f6123ae71697463cad20f51e237e2035b41af0513d8',
      ).toJson(),
    );
  }
}
