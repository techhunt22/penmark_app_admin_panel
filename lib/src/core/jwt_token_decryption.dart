import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'session_storage.dart';

// var loadtoken = SessionManager.instance.getSession("access_token");
//
//
//   String token =  loadtoken ?? "";


class JwtHelper {
  /// Fetches the latest token from session storage
  static Future<String?> _getToken() async {
    return SessionManager.instance.getSession("access_token");
  }

  /// Decodes the JWT token and returns the payload as a Map
  static Future<Map<String, dynamic>?> decodeJwt() async {
    String? token = await _getToken();

    if (token == null || token.isEmpty) {
      if (kDebugMode) {
        print("Token is missing.");
      }
      return null;
    }

    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        if (kDebugMode) {
          print("Invalid token format");
        }
        return null;
      }

      // Decode Payload
      final payload = json.decode(
          utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));

      if (kDebugMode) {
        print("Raw Payload: $token");

      }
      if (kDebugMode) {
        print("Decoded Payload: $payload");
      }

      return payload;
    } catch (e) {
      if (kDebugMode) {
        print("Error decoding token: $e");
      }
      return null;
    }
  }

  /// Converts a Unix timestamp to a readable date-time format
  static String formatTimestamp(int timestamp) {
    final dateTime =
    DateTime.fromMillisecondsSinceEpoch(
        timestamp * 1000); // Convert seconds to milliseconds

    return "${dateTime.year}-${dateTime.month.toString().padLeft(
        2, '0')}-${dateTime.day.toString().padLeft(2, '0')} "
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute
        .toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(
        2, '0')}";
  }

  /// Validates the JWT token and checks expiration status
  static Future<String> validateToken() async {
    final payload = await decodeJwt();

    if (payload == null) {
      return "Invalid token payload.";
    }
    final ca = formatTimestamp(payload['iat']);
    final ea = formatTimestamp(payload['exp']);

    if (kDebugMode) {
      print("Decoded Payload:\n"
          "ID: ${payload['_id']}\n"
          "Email: ${payload['email']}\n"
          "Token Created at: $ca\n"
          "Token Expiry at: $ea");
    }

    final exp = payload['exp'];
    final now = DateTime
        .now()
        .millisecondsSinceEpoch ~/ 1000;

    if (exp != null && now > exp) {
      if (kDebugMode) {
        print("Token has expired.");
      }
      return "Token has expired.";
    }

    if (kDebugMode) {
      print("Token is valid.");
    }
    return "Token is valid.";
  }

}