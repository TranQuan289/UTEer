import 'dart:io';

import 'package:dio/dio.dart';
import 'package:uteer/data/remote/api_exception.dart';
import 'package:uteer/data/remote/base_api_service.dart';
import 'package:uteer/services/shared_pref_service.dart';
import 'package:uteer/utils/log_utils.dart';

class NetworkApiServices extends BaseApiService {
  @override
  Future get({required String url}) async {
    final String? userToken = SharedPrefService.instance.userToken;
    Options options = Options();
    if (userToken != null && userToken.isNotEmpty) {
      options = Options(headers: {"Authorization": "Bearer $userToken"});
    }
    try {
      final response = await dio.get(Uri.parse(baseUrl + url).toString(), options: options);
      return response.data;
    } on DioError catch (dioError) {
      onError(dioError);
    }
  }

  @override
  Future post({required String url, data}) async {
    final String? token = SharedPrefService.instance.userToken;
    try {
      Options options = Options();
      if (token != null && token.isNotEmpty) {
        options.headers = {"Authorization": "Bearer $token"};
      }

      final response =
          await dio.post(Uri.parse(baseUrl + url).toString(), data: data, options: options);
      return response.data;
    } on DioError catch (dioError) {
      onError(dioError);
    }
  }

  @override
  Future put({required String url, data}) async {
    final String? token = SharedPrefService.instance.userToken;
    try {
      Options options = Options();
      if (token != null && token.isNotEmpty) {
        options.headers = {"Authorization": "Bearer $token"};
      }
      final response =
          await dio.put(Uri.parse(baseUrl + url).toString(), data: data, options: options);
      return response.data;
    } on DioError catch (dioError) {
      onError(dioError);
    }
  }

  @override
  Future delete({required String url}) async {
    final String? token = SharedPrefService.instance.userToken;
    try {
      Options options = Options();
      if (token != null && token.isNotEmpty) {
        options.headers = {"Authorization": "Bearer $token"};
      }
      final response = await dio.delete(Uri.parse(baseUrl + url).toString(), options: options);
      return response.data;
    } on DioError catch (dioError) {
      onError(dioError);
    }
  }

  void onError(DioError err) {
    LogUtils.d(err.toString());

    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw TimeoutExceededException();
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case HttpStatus.badRequest:
            LogUtils.d(err.response!.data.toString());
            final message = err.response?.data["message"] is List
                ? err.response?.data["message"][0].toString()
                : err.response?.data["message"].toString();
            throw BadRequestException(message: message);
          case HttpStatus.unauthorized:
            throw UnauthorizedException();
          case HttpStatus.forbidden:
            throw ForbiddenException();
          case HttpStatus.notFound:
            throw NotFoundException(errorMessage: err.response?.data["message"].toString());
          case HttpStatus.conflict:
            throw ConflictException();
          case HttpStatus.internalServerError:
            throw InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        throw NoInternetConnectionException();
      case DioErrorType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioErrorType.connectionError:
        throw NoInternetConnectionException();
    }
  }
}
