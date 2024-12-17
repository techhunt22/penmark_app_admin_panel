class AppRoutes {
  // Sidebar Routes
  static const String auth = '/auth';
  static const String dashboard = '/dashboard';
  static const String templates = '/templates';
  static const String collections = '/collections';
  static const String users = '/users';
  static const String usersdetail = '/usersdetail';
  static const String usersorderdetail = '/usersorderdetail';
  static const String orders = '/orders';
  static const String settings = '/settings';
  static const String logout = '/logout';

  // Additional Content Routes (not in sidebar)
  static const String recentActivity = '/recentactivity';
  static const String analytics = '/analytics';
  static const String notifications = '/notifications';
  // Add any other routes that aren't in the sidebar

  // Helper method to check if route is a sidebar route
  static bool isSidebarRoute(String route) {
    return [
      dashboard,
      templates,
      collections,
      users,
      orders,
      settings,
    ].contains(route);
  }
}