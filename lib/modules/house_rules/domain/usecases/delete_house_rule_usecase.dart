import 'package:dartz/dartz.dart';
import 'package:house_app/lib.dart';

abstract class IDeleteHouseRuleUseCase {
  Future<Either<Failure, void>> call(EntitiesEntity param);
}

class DeleteHouseRuleUseCase implements IDeleteHouseRuleUseCase {
  final IHouseRulesRepository _repository;

  DeleteHouseRuleUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(EntitiesEntity param) async => await _repository.deleteRule(param);
}
