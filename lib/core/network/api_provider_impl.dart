import 'package:app_shoes_ecommerce/core/network/api_provider.dart';
import 'package:app_shoes_ecommerce/core/secrets/app_secrets.dart';
import 'package:app_shoes_ecommerce/core/utilities/end_point.dart';
import 'package:dio/dio.dart';

class APIProviderImpl implements APIProvider {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrlPath,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 5),
    ),
  );
  @override
  Future<Response> get(
      {String? baseUrl,
      required String endPoint,
      data,
      query,
      String? token,
      CancelToken? cancelToken,
      int? timeOut,
      bool isMultipart = false}) async {
    if (timeOut != null) {
      dio.options.connectTimeout = Duration(seconds: timeOut);
    }

    dio.options.headers = {
      'X-Authorization': AppSecrets.apiKey,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    return await dio.get(
      endPoint,
      queryParameters: query,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> post(
      {String? baseUrl,
      required String endPoint,
      data,
      query,
      String? token,
      ProgressCallback? progressCallback,
      CancelToken? cancelToken,
      int? timeOut,
      bool isMultipart = false}) async {
    if (timeOut != null) {
      dio.options.connectTimeout = Duration(seconds: timeOut);
    }

    dio.options.headers = {
      'X-Authorization': AppSecrets.apiKey,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    return await dio.post(
      endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> put(
      {String? baseUrl,
      required String endPoint,
      data,
      query,
      String? token,
      ProgressCallback? progressCallback,
      CancelToken? cancelToken,
      int? timeOut,
      bool isMultipart = false}) async {
    if (timeOut != null) {
      dio.options.connectTimeout = Duration(seconds: timeOut);
    }

    dio.options.headers = {
      'X-Authorization': AppSecrets.apiKey,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    return await dio.put(
      endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> delete(
      {String? baseUrl,
      required String endPoint,
      data,
      query,
      String? token,
      CancelToken? cancelToken,
      ProgressCallback? progressCallback,
      int? timeOut,
      bool isMultipart = false}) async {
    if (timeOut != null) {
      dio.options.connectTimeout = Duration(seconds: timeOut);
    }

    dio.options.headers = {
      'X-Authorization': AppSecrets.apiKey,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    return await dio.delete(
      endPoint,
      data: data,
      queryParameters: query,
      cancelToken: cancelToken,
    );
  }
}
