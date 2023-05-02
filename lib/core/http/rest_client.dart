import 'package:dio/dio.dart';
import 'package:house_app/lib.dart';

class RestClient implements IRestClient {
  final Dio _http;

  RestClient(this._http) {
    _http.options.connectTimeout = const Duration(seconds: 20);
    _http.options.receiveTimeout = const Duration(seconds: 20);
    _http.options.responseType = ResponseType.json;
    _http.options.contentType = Headers.jsonContentType;
  }

  @override
  Future<Response> delete(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async {
    _http.options.headers = _setHeaders(header);
    return await _executeRequest(
      _http.delete(
        path,
        queryParameters: queryParams,
        options: Options(
          headers: header,
        ),
      ),
    );
  }

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async {
    _http.options.headers = _setHeaders(header);
    return await _executeRequest(
      _http.get(
        path,
        queryParameters: queryParams,
      ),
    );
  }

  @override
  Future<Response> patch(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async {
    _http.options.headers = _setHeaders(header);
    return await _executeRequest(
      _http.patch(
        path,
        queryParameters: queryParams,
      ),
    );
  }

  @override
  Future<Response> post(
    String path, {
    body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async {
    _http.options.headers = _setHeaders(header);
    return await _executeRequest(
      _http.post(
        path,
        data: body,
        queryParameters: queryParams,
      ),
    );
  }

  @override
  Future<Response> put(
    String path, {
    body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  }) async {
    _http.options.headers = _setHeaders(header);
    return await _executeRequest(
      _http.put(
        path,
        data: body,
        queryParameters: queryParams,
      ),
    );
  }

  Future<Response> _executeRequest(Future<Response> action) async {
    try {
      return await action;
    } catch (error, stackTrace) {
      throw NetworkException(message: error.toString(), stackTrace: stackTrace);
    }
  }

  Map<String, dynamic> _setHeaders(Map<String, dynamic>? headers) {
    String? appToken;
    if (I.isRegistered<UserService>()) {
      appToken = I.get<UserService>().currentUser.token;
    }

    if (headers != null && !headers.containsKey('Authorization')) {
      headers['Authorization'] = 'Bearer $appToken';
    }

    final Map<String, dynamic> headerAuthorization;
    if (appToken != null) {
      headerAuthorization = {'Authorization': 'Bearer $appToken'};
    } else {
      headerAuthorization = {};
    }

    return headers ?? headerAuthorization;
  }
}
