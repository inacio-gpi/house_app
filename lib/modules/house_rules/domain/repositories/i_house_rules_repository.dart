import 'package:dartz/dartz.dart';
import 'package:house_app/lib.dart';

abstract class IHouseRulesRepository {
  Future<Either<Failure, HouseRulesEntity>> getHouseRules([String? linkUrl]);
  Future<Either<Failure, void>> createHouseRule(EntitiesEntity param);
  Future<Either<Failure, void>> updateRule(EntitiesEntity param);
  Future<Either<Failure, void>> deleteRule(EntitiesEntity param);
}
