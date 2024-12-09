import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/constants/font_family.dart';
import 'package:coloring_app_admin_panel/constants/font_size.dart';
import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final double width;
  final String title;
  final String title2;
  final Color color;
  final String icon;
  final VoidCallback onTap;

  const ActionCard({
    super.key,
    required this.width,
    required this.title,
    required this.icon,
    required this.onTap, required this.title2, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightgray.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: AppFontSize.displaysmall)),
            const SizedBox(
              height: 35,
            ),


            Container(
              height: 32,

              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("images/buttonshape.png", ),
                  fit: BoxFit.fitWidth,
                  colorFilter: ColorFilter.mode(
                    color,
                    BlendMode.srcIn,
                  ),
                )
              ),
              child:  Text(title2, style:  const TextStyle(fontSize: AppFontSize.bodylarge, fontWeight: AppFonts.semiBold)),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  icon,
                  height: 72,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

