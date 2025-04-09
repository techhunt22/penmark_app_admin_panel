import 'package:flutter/material.dart';

import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';

class BodyContainer extends StatelessWidget {
  final String text;
  final int flex;
  const BodyContainer({super.key, required this.text, required this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Text(
          text,
          maxLines: 2,
          textAlign: TextAlign.left, // Align text to the left

          style: const TextStyle(
              fontSize: AppFontSize.bodymedium, fontWeight: AppFonts.regular),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}




