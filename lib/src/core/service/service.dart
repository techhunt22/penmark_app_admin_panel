import 'package:coloring_app_admin_panel/src/core/service/handle_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../apis/api_url.dart';
import '../error/exception.dart';
import 'handle_error.dart';

class ApiService {
  final String baseUrl = ListAPI.baseUrl;
  final Dio dio = Dio();
  final Map<String, CancelToken> _cancelTokens = {};

  // Step 1: Singleton instance
  //static final ApiService instance = ApiService._internal();
  //ApiService._internal(){}
  // factory ApiService() => instance; //  Always returns the same instance

  ApiService() {
    dio.options.baseUrl = baseUrl;
    dio.options.headers['Content-Type'] = 'application/json';

    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            print('Request: ${options.uri}\n\n');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            print('Response: ${response.data}\n\n');
          }
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          if (kDebugMode) {
            print('Error: ${e.message}\n\n');
          }
          return handler.next(e);
        },
      ),
    );
  }

  // Step 5: Cancel a specific request by endpoint
  void cancelRequest(String endpoint) {
    if (_cancelTokens.containsKey(endpoint)) {
      _cancelTokens[endpoint]!.cancel("Request to $endpoint was cancelled");
      _cancelTokens.remove(endpoint);
    }
  }

  // Step 6: Cancel all ongoing requests
  void cancelAllRequests() {
    for (var token in _cancelTokens.values) {
      token.cancel("All requests cancelled");
    }
    _cancelTokens.clear();
  }

  /////////////////////////////////////
  // General GET request method with cancelation
  /////////////////////////////////////
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    CancelToken cancelToken = CancelToken();
    _cancelTokens[endpoint] = cancelToken; // Store cancel token

    try {
      Response response = await dio.get(
        endpoint,
        options: Options(
          headers: headers,

        ),
        queryParameters: queryParams,
        cancelToken: cancelToken, // Attach cancel token
      );
      _cancelTokens.remove(endpoint); // Remove after completion
      return handleResponse(response);
    } catch (e) {
      _cancelTokens.remove(endpoint);
      throw handleError(e);
    }
  }

  /////////////////////////////////////
  // General POST request method with cancelation
  /////////////////////////////////////
  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    CancelToken cancelToken = CancelToken();
    _cancelTokens[endpoint] = cancelToken;

    try {
      Response response = await dio.post(
        endpoint,
        options: Options(headers: headers,

        ),
        data: body,
        cancelToken: cancelToken,
      );
      _cancelTokens.remove(endpoint);
      return handleResponse(response);
    } catch (e) {
      _cancelTokens.remove(endpoint);
      throw handleError(e);
    }
  }

  /////////////////////////////////////
  // General DELETE request method with cancelation
  /////////////////////////////////////
  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? headers,
  }) async {
    CancelToken cancelToken = CancelToken();
    _cancelTokens[endpoint] = cancelToken;

    try {
      Response response = await dio.delete(
        endpoint,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      _cancelTokens.remove(endpoint);
      return handleResponse(response);
    } catch (e) {
      _cancelTokens.remove(endpoint);
      throw handleError(e);
    }
  }

  /////////////////////////////////////
  // General PUT request method with cancelation
  /////////////////////////////////////
  Future<Response> put(
    String endpoint, {
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    CancelToken cancelToken = CancelToken();
    _cancelTokens[endpoint] = cancelToken;

    try {
      Response response = await dio.put(
        endpoint,
        options: Options(headers: headers),
        data: body,
        cancelToken: cancelToken,
      );
      _cancelTokens.remove(endpoint);
      return handleResponse(response);
    } catch (e) {
      _cancelTokens.remove(endpoint);
      throw handleError(e);
    }
  }

  /////////////////////////////////////
  // Retry Mechanism
  /////////////////////////////////////
  Future<T> retry<T>(Future<T> Function() function,
      {int maxRetries = 3}) async {
    for (int attempt = 0; attempt <= maxRetries; attempt++) {
      try {
        return await function();
      } catch (e) {
        if (attempt == maxRetries) {
          rethrow;
        }
        await Future.delayed(Duration(seconds: 2 * attempt));
      }
    }
    throw ApiException(message: 'Max retries exceeded');
  }
}
