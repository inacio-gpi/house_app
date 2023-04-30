import 'package:dio/dio.dart';
import 'package:house_app/core/error/failure.dart';
import 'package:house_app/core/http/i_rest_client.dart';

class RestClient implements IRestClient {
  final Dio _http;

  RestClient(this._http);

  @override
  Future<Response> delete(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async =>
      await _executeRequest(
        _http.delete(
          path,
          queryParameters: queryParams,
          options: Options(
            headers: header,
          ),
        ),
      );

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async =>
      await _executeRequest(
        _http.get(
          path,
          queryParameters: queryParams,
          options: Options(
            headers: header,
          ),
        ),
      );

  @override
  Future<Response> patch(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async =>
      await _executeRequest(
        _http.patch(
          path,
          queryParameters: queryParams,
          options: Options(
            headers: header,
          ),
        ),
      );

  @override
  Future<Response> post(
    String path, {
    body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async =>
      await _executeRequest(
        _http.post(
          path,
          queryParameters: queryParams,
          options: Options(
            headers: header,
          ),
        ),
      );

  @override
  Future<Response> put(
    String path, {
    body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async =>
      await _executeRequest(
        _http.get(
          path,
          queryParameters: queryParams,
          options: Options(
            headers: header,
          ),
        ),
      );

  Future<Response> _executeRequest(Future<Response> action) async {
    try {
      return await action;
    } catch (error, stackTrace) {
      throw NetworkException(message: 'Erro ao obter dados da API', stackTrace: stackTrace);
    }
  }
}
