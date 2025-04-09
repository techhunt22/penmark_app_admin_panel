import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

class SessionManager {
  SessionManager._internal();
  static final SessionManager _instance = SessionManager._internal();
  static SessionManager get instance => _instance;

  static const int maxRetries = 3;
  static late Box _box;

  /// Initialize Hive storage
  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('sessionBox',

    );
  }

  /// Retry mechanism for storage operations
  bool _retry(Function operation, {String? errorMessage}) {
    for (int attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        operation();
        return true;
      } catch (e) {
        if (kDebugMode) print("Attempt $attempt failed: $e");
        if (attempt < maxRetries) sleep(Duration(milliseconds: 100 * attempt));
      }
    }
    if (kDebugMode) print(errorMessage ?? "Operation failed after $maxRetries attempts.");
    return false;
  }

  /// Save data with retry
  bool _saveData(String key, dynamic value) {
    return _retry(() => _box.put(key, value));
  }

  /// Retrieve data with retry
  dynamic _getData(String key) {
    for (int attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        return _box.get(key);
      } catch (e) {
        if (kDebugMode) print("Attempt $attempt to retrieve data failed: $e");
        if (attempt < maxRetries) sleep(Duration(milliseconds: 100 * attempt));
      }
    }
    return null;
  }

  /// Remove data with retry
  bool _removeData(String key) {
    return _retry(() => _box.delete(key));
  }

  /// Save session data
  bool saveSession(String key, String value) => _saveData(key, value);

  /// Retrieve session data
  String? getSession(String key) => _getData(key);

  /// Remove session key
  bool removeSession(String key) => _removeData(key);

  /// Clear all session storage
  bool clearAllSessions() {
    return _retry(() => _box.clear());
  }

  /// Save string value
  bool setString(String key, String value) => _saveData(key, value);

  /// Retrieve string value
  String? getString(String key) => _getData(key);

  /// Save string list
  bool setStringList(String key, List<String> value) {
    return _saveData(key, json.encode(value));
  }

  /// Retrieve string list
  List<String> getSessionList(String key) {
    String? jsonString = _getData(key);
    if (jsonString != null && jsonString.isNotEmpty) {
      try {
        List<dynamic> decoded = json.decode(jsonString);
        return List<String>.from(decoded);
      } catch (e) {
        if (kDebugMode) print("Error decoding string list: $e");
      }
    }
    return [];
  }
}
