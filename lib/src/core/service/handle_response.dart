



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
