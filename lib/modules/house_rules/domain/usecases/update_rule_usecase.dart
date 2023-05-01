import 'package:dartz/dartz.dart';
import 'package:house_app/lib.dart';

abstract class IUpdateRuleUseCase {
  Future<Either<Failure, void>> call(EntitiesEntity param);
}

class UpdateRuleUseCase implements IUpdateRuleUseCase {
  final IHouseRulesRepository _repository;

  UpdateRuleUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(EntitiesEntity param) async => await _repository.updateRule(param);
}
