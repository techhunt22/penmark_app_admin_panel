import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../constants/font_family.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final double borderradius;
  final double height;
  final double width;
  final double fontsize;
  final bool isLoading;  // Add this line

  const CustomButton({super.key,
    required this.onPressed,
    required this.text,this.isLoading = false,

    required this.color, required this.borderradius, required this.height, required this.width, required this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderradius),
        ),
        backgroundColor: color,

      ),

      child: isLoading
          ? const CircularProgressIndicator() : Text(text, style: TextStyle(
        color: AppColors.white,
          fontWeight: AppFonts.medium,fontSize:fontsize
      )),
    );
  }
}
