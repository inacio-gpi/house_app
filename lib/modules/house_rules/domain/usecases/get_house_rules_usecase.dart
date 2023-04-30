import 'package:dartz/dartz.dart';
import 'package:house_app/lib.dart';

abstract class IGetHouseRulesUseCase {
  Future<Either<Failure, HouseRulesEntity>> call([String? linkUrl]);
}

class GetHouseRulesUseCase implements IGetHouseRulesUseCase {
  final IHouseRulesRepository _repository;

  GetHouseRulesUseCase(this._repository);

  @override
  Future<Either<Failure, HouseRulesEntity>> call([String? linkUrl]) async => await _repository.getHouseRules(linkUrl);
}
