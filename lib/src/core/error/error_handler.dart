import 'package:flutter/foundation.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/snackbar_widget.dart';

class ErrorHandler {
  static void handleError(String errorMessage) {
    // You can also log errors or send them to an error tracking service
    if (kDebugMode) {
      print("⚠️ Error: $errorMessage");
    }

    // Show the error using GetX Snackbar or a global UI alert
    showSnackbar(
      title: "Error",
      message: errorMessage,
      backgroundColor: AppColors.red,
    );
  }
}
