import 'package:dartz/dartz.dart';
import 'package:house_app/lib.dart';

abstract class IDoLoginUseCase {
  Future<Either<Failure, void>> call({required String name});
}

class DoLoginUseCase implements IDoLoginUseCase {
  final ILoginRepository _repository;

  DoLoginUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call({required String name}) async => await _repository.doLogin(name: name);
}
