// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:universal_html/html.dart';
//
// class SessionManager {
//   SessionManager._internal();
//   static final SessionManager _instance = SessionManager._internal();
//   static SessionManager get instance => _instance;
//
//   static const int maxRetries = 3;
//
//   /// Retry mechanism for synchronous operations
//   bool _retry(Function operation, {String? errorMessage}) {
//     for (int attempt = 1; attempt <= maxRetries; attempt++) {
//       try {
//         operation();
//         return true;
//       } catch (e) {
//         if (kDebugMode) print("Attempt $attempt failed: $e");
//         if (attempt < maxRetries) sleep(Duration(milliseconds: 100 * attempt));
//       }
//     }
//     if (kDebugMode) print(errorMessage ?? "Operation failed after $maxRetries attempts.");
//     return false;
//   }
//
//   /// Save data with retry and failover to localStorage
//   bool _saveData(String key, String value) {
//     if (_retry(() => window.sessionStorage[key] = value)) return true;
//     return _retry(() => window.localStorage[key] = value);
//   }
//
//   /// Retrieve data with retry and fallback to localStorage
//   String? _getData(String key) {
//     for (int attempt = 1; attempt <= maxRetries; attempt++) {
//       try {
//         return window.sessionStorage[key] ?? window.localStorage[key];
//       } catch (e) {
//         if (kDebugMode) print("Attempt $attempt to retrieve data failed: $e");
//         if (attempt < maxRetries) sleep(Duration(milliseconds: 100 * attempt));
//       }
//     }
//     return null;
//   }
//
//   /// Remove data with retry and failover to localStorage
//   bool _removeData(String key) {
//     if (_retry(() => window.sessionStorage.remove(key))) return true;
//     return _retry(() => window.localStorage.remove(key));
//   }
//
//   /// Save session data
//   bool saveSession(String key, String value) => _saveData(key, value);
//
//   /// Retrieve session data
//   String? getSession(String key) => _getData(key);
//
//   /// Remove session key
//   bool removeSession(String key) => _removeData(key);
//
//   /// Clear all session storage and fallback to clearing localStorage
//   bool clearAllSessions() {
//     bool success = _retry(() => window.sessionStorage.clear());
//     _retry(() => window.localStorage.clear());
//     return success;
//   }
//
//   /// Save string value
//   bool setString(String key, String value) => _saveData(key, value);
//
//   /// Retrieve string value
//   String? getString(String key) => _getData(key);
//
//   /// Save string list
//   bool setStringList(String key, List<String> value) {
//     return _saveData(key, json.encode(value));
//   }
//
//   /// Retrieve string list
//   List<String> getSessionList(String key) {
//     String? jsonString = _getData(key);
//     if (jsonString != null && jsonString.isNotEmpty) {
//       try {
//         List<dynamic> decoded = json.decode(jsonString);
//         return List<String>.from(decoded);
//       } catch (e) {
//         if (kDebugMode) print("Error decoding string list: $e");
//       }
//     }
//     return [];
//   }
// }
