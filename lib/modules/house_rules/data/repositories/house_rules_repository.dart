import 'package:dartz/dartz.dart';
import 'package:house_app/lib.dart';

class HouseRulesRepository extends IHouseRulesRepository {
  final IHouseRulesDataSource _dataSource;

  HouseRulesRepository(this._dataSource);

  @override
  Future<Either<Failure, HouseRulesEntity>> getHouseRules([String? linkUrl]) async {
    try {
      final result = await _dataSource.getHouseRules(linkUrl);
      return right(result.data);
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, void>> createHouseRule(EntitiesEntity param) async {
    try {
      final result = await _dataSource.createHouseRule(param);
      return right(result.data);
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, void>> updateRule(EntitiesEntity param) async {
    try {
      final result = await _dataSource.updateRule(param);
      return right(result.data);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
