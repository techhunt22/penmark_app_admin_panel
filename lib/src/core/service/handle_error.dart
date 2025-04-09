import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import '../error/exception.dart';

///////////////////////////////////
// Handle Errors
///////////////////////////////////
final Logger _logger = Logger();

Exception handleError(dynamic error) {
  _logger.e('Error occurred: $error');

  if (error is DioException) {



    if (error.response != null) {
      return _handleErrorResponse(error.response!);
    }

    // Handle DioException (network or server related issues)
    switch (error.type) {
      case DioExceptionType.connectionError:
        _logger.e('No internet connection detected.');
        return ApiException(message: 'Connection Error. Please try again later');

      case DioExceptionType.connectionTimeout:
        _logger.e('Connection timeout occurred.');
        return ApiException(message: 'Connection timeout occurred.');

      case DioExceptionType.receiveTimeout:
        _logger.e('Receive timeout occurred.');
        return ApiException(message: 'Receive timeout occurred.');

      case DioExceptionType.sendTimeout:
        _logger.e('Send timeout occurred.');
        return ApiException(message: 'Send timeout occurred.');

      case DioExceptionType.cancel:
        _logger.e('Request was cancelled.');
        return ApiException(message: 'Request was cancelled.');

      case DioExceptionType.unknown:
        _logger.e('Unknown error: ${error.message}');
        return ApiException(message: 'Unknown error: ${error.message}');

      default:
        _logger.e('Unknown error: ${error.message}');
        return ApiException(message: 'Unknown error: ${error.message}');
    }
  } else if (error is SocketException) {
    // Handle no internet or network issues
    _logger.e('No internet connection: $error');
    return ApiException(message: 'No internet connection. Please check your network.');
  } else {
    // Handle any other types of errors
    _logger.e('Unexpected error occurred: $error');
    return ApiException(message: 'Unexpected error occurred: ${error.toString()}');
  }
}


/// Handles bad responses (e.g., 401, 404, 500) and creates proper exception messages.
ApiException _handleErrorResponse(Response response) {
  String errorMessage = _extractErrorMessage(response);

  // Log the error for debugging purposes
  _logger.e('API ERROR: ${response.statusCode} - ${response.data}');

  switch (response.statusCode) {
    case 400:
      return ApiException(message: errorMessage.isNotEmpty ? 'Bad Request: $errorMessage' : 'Invalid request. Please try again.');
    case 401:
      return ApiException(message: errorMessage.isNotEmpty ? 'Unauthorized: $errorMessage' : 'Unauthorized. Please log in again.');
    case 403:
      return ApiException(message:errorMessage.isNotEmpty ? 'Forbidden: $errorMessage' : 'Access denied.');
    case 404:
      return ApiException(message:errorMessage.isNotEmpty ? 'Not Found $errorMessage' : 'The requested resource was not found.');
    case 409:
      return ApiException(message: errorMessage.isNotEmpty ? 'Conflict: $errorMessage' : 'Conflict detected. Please try again.');
    case 429:
      return ApiException(message: errorMessage.isNotEmpty ? 'Too Many Requests: $errorMessage' : 'Too many requests. Try again later.');
    case 500:
      return ApiException(message:errorMessage.isNotEmpty ? 'Internal Server Error: $errorMessage': 'Server error. Please try again later.');
    case 502:
      return ApiException(message: errorMessage.isNotEmpty ? 'Bad Gateway: $errorMessage': 'Bad gateway. Try again later.');
    case 503:
      return ApiException(message:errorMessage.isNotEmpty ? 'Service Unavailable: $errorMessage': 'Server unavailable. Try again later.');
    case 504:
      return ApiException(message: errorMessage.isNotEmpty ? 'Gateway Timeout: $errorMessage': 'Server timeout. Try again later.');
    default:
      return ApiException(message: errorMessage.isNotEmpty ? 'Unexpected Error: $errorMessage' : 'An unexpected error occurred.');
  }
}


/// Helper function to extract error message from response


String _extractErrorMessage(Response response) {
  final result = response.data;

  try {

    if (response.data is Map<String, dynamic>) {
      final message = response.data['message'] ?? 'An error occurred, Please try again';
      return message;
    }

  } catch (e) {
    if (kDebugMode) {
      print('Error parsing API response: $result');
    }
  }
  return ''; // Return empty string if no valid message is found
}
