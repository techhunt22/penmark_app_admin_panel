import 'package:coloring_app_admin_panel/src/core/session_storage.dart';

class ApiHeaders {
  static Map<String, String> getAuthHeaders() {

    String? token = SessionManager.instance.getSession("access_token");

    return {'Authorization': 'Bearer $token'};
  }
}
