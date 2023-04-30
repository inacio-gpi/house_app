import 'package:house_app/lib.dart';

abstract class IHouseRulesDataSource {
  Future<BaseResponse<HouseRulesModel>> getHouseRules([String? linkUrl]);
}

class HouseRulesDataSource extends IHouseRulesDataSource {
  final IRestClient _restClient;

  HouseRulesDataSource(this._restClient);

  @override
  Future<BaseResponse<HouseRulesModel>> getHouseRules([String? linkUrl]) async {
    final response = await _restClient.get(
      linkUrl ?? ApiRoutes.baseUrl,
      header: {'Authorization': 'Bearer 40fe071962846075452a4f6123ae71697463cad20f51e237e2035b41af0513d8'},
    );
    return BaseResponse<HouseRulesModel>(
      success: response.data['success'],
      data: HouseRulesModel.fromMap(response.data['data']),
      message: response.data['message'],
      statusCode: response.statusCode,
    );
  }
}
