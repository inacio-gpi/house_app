import 'package:dio/dio.dart';

abstract class IRestClient {
  Future<Response> get(
    String path, {
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  });
  Future<Response> post(
    String path, {
    dynamic body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  });
  Future<Response> put(
    String path, {
    dynamic body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  });
  Future<Response> patch(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  });
  Future<Response> delete(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParams,
  });
}
