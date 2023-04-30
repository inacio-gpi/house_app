import 'dart:async';

import 'package:house_app/lib.dart';

class UserService {
  UserService(this._localStorage);
  final ILocalStorage _localStorage;

  UserModel _user = UserModel.empty();
  UserModel get currentUser => _user;

  Future<void> setUserInfo(UserModel userParam) async {
    _user = userParam;
  }

  Future<void> userLogout() async {
    await _localStorage.deleteData(CACHED_USER);
    _user = UserModel.empty();
  }
}
