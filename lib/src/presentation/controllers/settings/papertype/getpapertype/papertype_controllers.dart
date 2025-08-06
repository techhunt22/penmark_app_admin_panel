import 'package:flutter/material.dart';


class PaperTypeFieldControllers {
  final TextEditingController typeController;
  final TextEditingController priceController;

  PaperTypeFieldControllers({
    required String type,
    required double price,
  })  : typeController = TextEditingController(text: type),
        priceController = TextEditingController(text: price.toString());

  void dispose() {
    typeController.dispose();
    priceController.dispose();
  }
}
