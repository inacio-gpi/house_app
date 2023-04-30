class BaseResponse<T> {
  BaseResponse({
    required this.success,
    required this.data,
    this.statusCode,
    this.message,
  });
  bool success;
  T data;
  String? message;
  int? statusCode;
}
