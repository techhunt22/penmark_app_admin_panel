import 'package:coloring_app_admin_panel/src/domain/entities/user/get_user_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


class UsersCache {
  final Map<int, List<GetUsersDataEntity>> _cache = {};
  final Map<int, DateTime> _cacheTimestamps = {}; // new
  var totalCachedItems = 0.obs;

  final int maxCacheSize = 25;
  final Duration cacheExpiry = const Duration(minutes: 9); // new

  bool containsPage(int page) {
    if (!_cache.containsKey(page)) return false;

    // Check if data is still fresh
    final cachedTime = _cacheTimestamps[page];
    if (cachedTime == null) return false;

    final isFresh = DateTime.now().difference(cachedTime) < cacheExpiry;
    return isFresh;
  }

  List<GetUsersDataEntity>? getPage(int page) => _cache[page];

  void cachePage(int page, List<GetUsersDataEntity> data) {
    while (totalCachedItems.value + data.length > maxCacheSize) {
      evictOldestPage();
    }

    _cache[page] = data;
    _cacheTimestamps[page] = DateTime.now(); // save timestamp
    totalCachedItems.value += data.length;
  }

  void evictOldestPage() {
    if (_cache.isNotEmpty) {
      int oldestPage = _cacheTimestamps.entries.reduce((a, b) =>
      a.value.isBefore(b.value) ? a : b).key; // Finds the oldest cached page

      totalCachedItems.value -= _cache[oldestPage]!.length;
      _cache.remove(oldestPage);
      _cacheTimestamps.remove(oldestPage);
    }
  }


  void clearCache() {
    _cache.clear();
    _cacheTimestamps.clear();
    totalCachedItems.value = 0;
    if (kDebugMode) print('Cache cleared.');
  }

  void logCacheUsage() {
    if (kDebugMode) {
      print('Cache size: ${_cache.length} pages, Total Users Cached Items: ${totalCachedItems.value}');
    }
  }
}
