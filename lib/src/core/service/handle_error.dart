import 'dart:io';

import 'package:dio/dio.dart';

import '../error/exception.dart';

///////////////////////////////////
// Handle Errors
///////////////////////////////////

Exception handleError(dynamic error) {
  if (error is DioException) {
    // Handle DioException (network or server related issues)
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException(message: 'Connection timeout occurred.');
      case DioExceptionType.receiveTimeout:
        return ApiException(message: 'Receive timeout occurred.');
      case DioExceptionType.sendTimeout:
        return ApiException(message: 'Send timeout occurred.');
      case DioExceptionType.badResponse:
        return ApiException(message: 'Server responded with error: ${error.response?.statusCode}');
      case DioExceptionType.cancel:
        return ApiException(message: 'Request was cancelled.');
      case DioExceptionType.unknown:
        return ApiException(message: 'Unknown error: ${error.message}');
      default:
        return ApiException(message: 'Unknown Dio error: ${error.message}');
    }
  } else if (error is SocketException) {
    // Handle no internet or network issues
    return ApiException(message: 'No internet connection. Please check your network.');
  } else {
    // Handle any other types of errors
    return ApiException(message: 'Unexpected error occurred: ${error.toString()}');
  }
}