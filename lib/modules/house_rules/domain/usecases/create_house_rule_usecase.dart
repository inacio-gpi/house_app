import 'package:dartz/dartz.dart';
import 'package:house_app/lib.dart';

abstract class ICreateHouseRuleUseCase {
  Future<Either<Failure, void>> call(EntitiesEntity param);
}

class CreateHouseRuleUseCase implements ICreateHouseRuleUseCase {
  final IHouseRulesRepository _repository;

  CreateHouseRuleUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(EntitiesEntity param) async => await _repository.createHouseRule(param);
}
