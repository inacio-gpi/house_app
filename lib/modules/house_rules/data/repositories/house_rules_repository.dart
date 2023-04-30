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
}
