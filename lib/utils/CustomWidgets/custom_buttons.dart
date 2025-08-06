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
        backgroundColor: color.withValues(alpha:opacity),
      ),

      child: isLoading
          ? const CircularProgressIndicator() : Text(text, style: TextStyle(
        color: textcolor,
          fontWeight: AppFonts.medium,fontSize:fontsize
      )),
    );
  }
}



class CustomTextIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String img;
  final Color color;
  final double opacity;
  final Color textcolor;
  final double borderradius;
  final double height;
  final double width;
  final double fontsize;
  final bool isLoading;

  const CustomTextIconButton({super.key,
    required this.onPressed,
    required this.text,this.isLoading = false,

    required this.color, required this.borderradius, required this.height, required this.width, required this.fontsize, required this.textcolor,required this.opacity, required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: Size(width, height),
          shadowColor: AppColors.transparent,
          overlayColor: AppColors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),

          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          backgroundColor: color.withValues(alpha:opacity),
        ),
        onPressed: onPressed,
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          runSpacing: 10,
          spacing: 10,

          children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: fontsize,
                    color: textcolor,
                    fontWeight: AppFonts.regular),
              ),
            Image.asset(img)
          ],
        ));
  }
}


class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? img;
  final Color color;

  const CustomIconButton({super.key,
    required this.onPressed,
    required this.color,  this.img,
  });

  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
        style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                vertical: 20, horizontal: 0)),
            backgroundColor:
            WidgetStatePropertyAll(color),
            splashFactory: NoSplash.splashFactory,
            shadowColor:
            WidgetStatePropertyAll(Colors.transparent),
            overlayColor:
            WidgetStatePropertyAll(AppColors.transparent),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            )),
        onPressed: onPressed,
        child: Image.asset(img!));
  }
}




