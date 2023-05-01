import 'package:house_app/lib.dart';

abstract class IHouseRulesDataSource {
  Future<BaseResponse<HouseRulesModel>> getHouseRules([String? linkUrl]);
  Future<BaseResponse<void>> createHouseRule(EntitiesEntity param);
}

class HouseRulesDataSource extends IHouseRulesDataSource {
  final IRestClient _restClient;

  HouseRulesDataSource(this._restClient);

  @override
  Future<BaseResponse<HouseRulesModel>> getHouseRules([String? linkUrl]) async {
    final response = await _restClient.get(linkUrl?.replaceAll('http', 'https') ?? ApiRoutes.baseUrl);
    return BaseResponse<HouseRulesModel>(
      success: response.data['success'],
      data: HouseRulesModel.fromMap(response.data['data']),
      message: response.data['message'],
      statusCode: response.statusCode,
    );
  }

  @override
  Future<BaseResponse<void>> createHouseRule(EntitiesEntity param) async {
    final response = await _restClient.post(
      ApiRoutes.baseUrl,
      body: EntitiesModel.toCreateRule(param),
    );
    return BaseResponse<void>(
      success: response.data['success'],
      data: null,
      message: response.data['message'],
      statusCode: response.statusCode,
    );
  }
}
