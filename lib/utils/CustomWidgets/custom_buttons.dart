import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../constants/font_family.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final double opacity;
  final Color textcolor;
  final double borderradius;
  final double height;
  final double width;
  final double fontsize;
  final bool isLoading;  // Add this line

  const CustomButton({super.key,
    required this.onPressed,
    required this.text,this.isLoading = false,

    required this.color, required this.borderradius, required this.height, required this.width, required this.fontsize, required this.textcolor,required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        splashFactory: NoSplash.splashFactory,
        overlayColor: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderradius),
        ),
        backgroundColor: color.withOpacity(opacity),
      ),

      child: isLoading
          ? const CircularProgressIndicator() : Text(text, style: TextStyle(
        color: textcolor,
          fontWeight: AppFonts.medium,fontSize:fontsize
      )),
    );
  }
}
