import 'package:dartz/dartz.dart';
import 'package:house_app/lib.dart';

class LoginRepository extends ILoginRepository {
  final ILoginLocalDataSource _dataSource;

  LoginRepository(this._dataSource);

  @override
  Future<Either<Failure, void>> doLogin({required String name}) async {
    try {
      final result = await _dataSource.doLogin(name: name);
      return right(result);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
