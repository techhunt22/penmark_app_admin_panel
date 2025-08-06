import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/color_constants.dart'; // Ensure you have access to AppColors


void showSnackbar({
  required String title,
  required String message,
  required Color backgroundColor,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
  int durationInSeconds = 2,
  double maxWidth = 1000, // You can adjust this as needed
  AlignmentGeometry alignment = Alignment.bottomRight, // or center
}) {
  Get.snackbar(
    title,
    message,
    snackPosition: snackPosition,
    margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
    backgroundColor: backgroundColor,
    colorText: AppColors.white,
    duration: Duration(seconds: durationInSeconds),
    isDismissible: true,
    borderRadius: 12,
    snackStyle: SnackStyle.FLOATING,
    maxWidth: maxWidth,
    forwardAnimationCurve: Curves.easeOut,
  );
}
