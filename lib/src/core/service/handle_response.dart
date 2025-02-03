//
// import 'package:dio/dio.dart';
// import 'package:logger/logger.dart';
//
// import '../error/exception.dart';
//
// ///////////////////////////////////
// // Handle Response
// ///////////////////////////////////
// final Logger _logger = Logger();
//
// Response handleResponse(Response response) {
//
//
//   if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
//     _logger.i('Response received: ${response.statusCode} - ${response.data}');
//     // Successful responses
//     return response;
//   }
//
//   // Handle errors and extract the message from the response
//   String errorMessage = _extractErrorMessage(response);
//   _logger.e('Error Response received: ${response.statusCode} - ${response.data}');
//
//   switch (response.statusCode) {
//     case 400:
//       throw ApiException(message: 'Bad Request: $errorMessage');
//     case 401:
//       throw ApiException(message: 'Unauthorized: $errorMessage');
//     case 403:
//       throw ApiException(message: 'Forbidden: $errorMessage');
//     case 404:
//       throw ApiException(message: 'Not Found: $errorMessage');
//     case 409:
//       throw ApiException(message: 'Conflict: $errorMessage');
//     case 429:
//       throw ApiException(message: 'Too Many Requests: $errorMessage');
//     case 500:
//       throw ApiException(message: 'Internal Server Error: $errorMessage');
//     case 502:
//       throw ApiException(message: 'Bad Gateway: $errorMessage');
//     case 503:
//       throw ApiException(message: 'Service Unavailable: $errorMessage');
//     case 504:
//       throw ApiException(message: 'Gateway Timeout: $errorMessage');
//     default:
//       throw ApiException(message: 'Unexpected Error: $errorMessage');
//   }
// }
//
// /// Helper function to extract error message from response
// String _extractErrorMessage(Response response) {
//   try {
//     // Handle JSON responses with a 'message' field
//     if (response.headers['Content-Type']?.contains('application/json') == true) {
//       return response.data?['message'] ?? 'An error occurred, Please try again';
//     }
//
//     // Handle HTML responses
//     if (response.headers['Content-Type']?.contains('text/html') == true) {
//       return 'Unexpected Error. Please try again';
//     }
//
//     // Fallback for unexpected response types
//     return response.data?.toString() ?? 'An unknown error occurred.';
//
//   } catch (e) {
//     _logger.e('Error extracting message from response: $e');
//     return 'Failed to parse error message.';
//   }
// }
//




import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../error/exception.dart';

final Logger _logger = Logger();

///////////////////////////////////
// Handle Response
///////////////////////////////////
Response handleResponse(Response response) {
  if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
    // Log and return the successful response
    _logger.i('Response received: ${response.statusCode} - ${response.data}');
    return response;
  }

  // If status code is not in the successful range, throw error (this is handled by Dio)
  // so we don't need to manually handle it here.
  throw ApiException(message: 'Unexpected Error: ${response.statusCode}');
}
