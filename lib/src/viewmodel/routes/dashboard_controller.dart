import 'package:coloring_app_admin_panel/src/view/auth/auth_screen.dart';
import 'package:coloring_app_admin_panel/src/view/collections/collections_screen.dart';
import 'package:coloring_app_admin_panel/src/view/orders/orders_screen.dart';
import 'package:coloring_app_admin_panel/src/view/settings/settings_screen.dart';
import 'package:coloring_app_admin_panel/src/view/templates/templates_screen.dart';
import 'package:coloring_app_admin_panel/src/view/users/users_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/CustomWidgets/error_screen.dart';
import '../../../utils/app_routes.dart';
import '../../view/dashboard/dashboard_widget.dart';
import '../../view/recent_activity/recent_activity.dart';

class DashboardController extends GetxController {
  final _currentRoute = ''.obs;
  final _previousRoute = ''.obs;
  final Map<String, Widget> _widgetCache = {};

  String get currentRoute => _currentRoute.value;
  String get previousRoute => _previousRoute.value;

  Widget getContentWidget(String route) {
    try {
      return _widgetCache.putIfAbsent(route, () {
        return switch (route) {
        // Sidebar Content
          AppRoutes.dashboard => const DashboardContent(key: ValueKey('dashboard')),
          AppRoutes.templates => const TemplatesScreen(key: ValueKey('templates')),
          AppRoutes.collections => const CollectionsScreen(key: ValueKey('collections')),
          AppRoutes.users => const UsersScreen(key: ValueKey('users')),
          AppRoutes.orders => const OrdersScreen(key: ValueKey('orders')),
          AppRoutes.settings => const SettingsScreen(key: ValueKey('settings')),

        // Additional Content (not in sidebar)
          AppRoutes.recentActivity => const RecentActivity(key: ValueKey('recent_activity')),
          AppRoutes.analytics => const RecentActivity(key: ValueKey('analytics')),
          AppRoutes.notifications => const RecentActivity(key: ValueKey('notifications')),

        // Default fallback
          _ => const DashboardContent(key: ValueKey('dashboard')),
        };
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading route $route: $e');
      }
      return ErrorScreen(
        message: 'Unable to load content for $route',
      );
    }
  }


  // Modify changePage to track history
  void changePage(String route) {
    try {
      if (AppRoutes.isSidebarRoute(route)) {
        _previousRoute.value = '';
        _routeHistory.clear(); // Clear history for sidebar routes
      } else {
        _previousRoute.value = _currentRoute.value;
        _routeHistory.add(_currentRoute.value); // Add to history
      }
      _currentRoute.value = route;

      // Optional: Print debug information
      _printDebugInfo();
    } catch (e) {
      if (kDebugMode) {
        print('Error changing page: $e');
      }
      Get.toNamed('/error', arguments: 'Unable to navigate to $route');
    }
  }
  void goBack() {
    if (_previousRoute.value.isNotEmpty) {
      // Store current route before changing
      final tempCurrentRoute = _currentRoute.value;

      // Set current route to previous route
      _currentRoute.value = _previousRoute.value;

      // Update previous route
      _previousRoute.value = tempCurrentRoute;

      // Add to history
      _routeHistory.add(tempCurrentRoute);

      // Print debug info
      _printDebugInfo();
    } else {
      // Optional: Show message when there's no previous route
      Get.snackbar(
        'Navigation',
        'No previous page to go back to',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

// Initialize with dashboard route
  @override
  void onInit() {
    super.onInit();
    _currentRoute.value = AppRoutes.dashboard; // Set initial route
  }

  // Method to get all cached routes
  List<String> getCachedRoutes() {
    return _widgetCache.keys.toList();
  }

  // Method to get cache size
  int getCacheSize() {
    return _widgetCache.length;
  }

  // Method to check if there's a previous route
  bool hasPreviousRoute() {
    return _previousRoute.value.isNotEmpty;
  }

  // Method to get navigation history (you'll need to add this property first)
  final RxList<String> _routeHistory = <String>[].obs;
  List<String> get routeHistory => _routeHistory.toList();



  // Debug method to print current state
  void _printDebugInfo() {
    if (kDebugMode) {
      print('''
    ======= Dashboard Controller State =======
    Current Route: ${_currentRoute.value}
    Previous Route: ${_previousRoute.value}
    Cached Routes: ${getCachedRoutes()}
    Cache Size: ${getCacheSize()}
    Route History: ${_routeHistory.toList()}
    =======================================
    ''');
    }
  }





  // Clear cache for specific route or all routes
  void clearCache([String? route]) {
    if (route != null) {
      _widgetCache.remove(route);
    } else {
      _widgetCache.clear();
    }
  }
  Future<void> handleLogout(BuildContext context) async {
    try {
      // Clear all caches
      clearCache();
      // Clear route history
      _routeHistory.clear();
      // Reset routes
      _currentRoute.value = '';
      _previousRoute.value = '';
      // Navigate to login
      await  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AuthScreen(),));

    } catch (e) {
      if (kDebugMode) {
        print('Logout error: $e');
      }
      Get.snackbar('Error', 'Unable to logout. Please try again.');
    }
  }
  @override
  void onClose() {
    _widgetCache.clear();
    super.onClose();
  }
}
