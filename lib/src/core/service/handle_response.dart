
import 'package:dio/dio.dart';

import '../error/exception.dart';

///////////////////////////////////
// Handle Response
///////////////////////////////////

Response handleResponse(Response response) {
  if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
    // Successful responses
    return response;
  }

  // Handle errors and extract the message from the response
  String errorMessage = _extractErrorMessage(response);

  switch (response.statusCode) {
    case 400:
      throw ApiException(message: 'Bad Request: $errorMessage');
    case 401:
      throw ApiException(message: 'Unauthorized: $errorMessage');
    case 403:
      throw ApiException(message: 'Forbidden: $errorMessage');
    case 404:
      throw ApiException(message: 'Not Found: $errorMessage');
    case 409:
      throw ApiException(message: 'Conflict: $errorMessage');
    case 429:
      throw ApiException(message: 'Too Many Requests: $errorMessage');
    case 500:
      throw ApiException(message: 'Internal Server Error: $errorMessage');
    case 502:
      throw ApiException(message: 'Bad Gateway: $errorMessage');
    case 503:
      throw ApiException(message: 'Service Unavailable: $errorMessage');
    case 504:
      throw ApiException(message: 'Gateway Timeout: $errorMessage');
    default:
      throw ApiException(message: 'Unexpected Error: $errorMessage');
  }
}

/// Helper function to extract error message from response
String _extractErrorMessage(Response response) {
  try {
    // Handle JSON responses with a 'message' field
    if (response.headers['Content-Type']?.contains('application/json') == true) {
      return response.data?['message'] ?? 'An error occurred, Please try again';
    }

    // Handle HTML responses
    if (response.headers['Content-Type']?.contains('text/html') == true) {
      return 'Unexpected Error. Please try again';
    }

    // Fallback for unexpected response types
    return response.data?.toString() ?? 'An unknown error occurred.';

  } catch (e) {
    // Handle cases where response.data is null or not parseable
    return 'Failed to parse error message.';
  }
}

