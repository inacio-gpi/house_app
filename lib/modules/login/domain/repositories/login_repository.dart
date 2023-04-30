import 'package:dartz/dartz.dart';
import 'package:house_app/lib.dart';

abstract class ILoginRepository {
  Future<Either<Failure, void>> doLogin({required String name});
}
