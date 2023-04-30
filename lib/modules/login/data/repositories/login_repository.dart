import 'package:dartz/dartz.dart';
import 'package:house_app/lib.dart';

class LoginRepository extends ILoginRepository {
  final ILoginLocalDataSource _dataSource;
  final UserService _userService;

  LoginRepository(this._dataSource, this._userService);

  @override
  Future<Either<Failure, void>> doLogin({required String name}) async {
    try {
      final result = await _dataSource.doLogin(name: name);
      await _userService.setUserInfo(result);
      return right(null);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
