import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class Api {

  final Dio _dio = Dio();

  // ============ GET =================
  @factoryMethod
  Future<Response?> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async{
    try {

      var response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options
      );
      return response;

    } catch (error) {
      if (error is DioException) {
        log("$error");
        return error.response;
      } else if (error is SocketException) {
        log("No Internet connection: $error");
        return Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 500,
          statusMessage: "No Internet connection",
        );
      } else {
        throw Exception(error);
      }
    }
  }

  // ============ POST =================
  @factoryMethod
  Future<Response?> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async{
    try {

      var response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options
      );
      return response;

    } catch (error) {
      if (error is DioException) {
        log("$error");
        return error.response;
      } else if (error is SocketException) {
        log("No Internet connection: $error");
        return Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 500,
          statusMessage: "No Internet connection",
        );
      } else {
        throw Exception(error);
      }
    }
  }

  // ============ PATCH =================
  @factoryMethod
  Future<Response?> patch(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async{
    try {

      var response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options
      );
      return response;

    } catch (error) {
      if (error is DioException) {
        log("$error");
        return error.response;
      } else if (error is SocketException) {
        log("No Internet connection: $error");
        return Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 500,
          statusMessage: "No Internet connection",
        );
      } else {
        throw Exception(error);
      }
    }
  }

  // ============ PUT =================
  @factoryMethod
  Future<Response?> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async{
    try {

      var response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options
      );
      return response;

    } catch (error) {
      if (error is DioException) {
        log("$error");
        return error.response;
      } else if (error is SocketException) {
        log("No Internet connection: $error");
        return Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 500,
          statusMessage: "No Internet connection",
        );
      } else {
        throw Exception(error);
      }
    }
  }

  // ============ DELETE =================
  @factoryMethod
  Future<Response?> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async{
    try {

      var response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options
      );
      return response;

    } catch (error) {
      if (error is DioException) {
        log("$error");
        return error.response;
      } else if (error is SocketException) {
        log("No Internet connection: $error");
        return Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 500,
          statusMessage: "No Internet connection",
        );
      } else {
        throw Exception(error);
      }
    }
  }

}