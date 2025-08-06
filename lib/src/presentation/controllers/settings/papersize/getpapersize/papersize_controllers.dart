
import 'package:flutter/material.dart';

class PaperSizeFieldControllers {
  final TextEditingController sizeController;
  final TextEditingController priceController;

  PaperSizeFieldControllers({
    required String size,
    required double price,
  })  : sizeController = TextEditingController(text: size),
        priceController = TextEditingController(text: price.toString());

  void dispose() {
    sizeController.dispose();
    priceController.dispose();
  }
}