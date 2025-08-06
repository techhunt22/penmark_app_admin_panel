
import 'package:flutter/material.dart';

class GetChargesFieldControllers {
  final TextEditingController taxController;
  final TextEditingController deliveryController;

  GetChargesFieldControllers({
    required double tax,
    required double delivery,
  })  : taxController = TextEditingController(text: tax.toString()),
        deliveryController = TextEditingController(text: delivery.toString());

  void dispose() {
    taxController.dispose();
    deliveryController.dispose();
  }
}