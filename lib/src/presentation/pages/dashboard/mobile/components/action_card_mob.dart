import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/constants/font_family.dart';
import 'package:coloring_app_admin_panel/constants/font_size.dart';
import 'package:flutter/material.dart';

class ActionCardMob extends StatelessWidget {
  final double width;
  final String title;
  final String title2;
  final Color color;
  final String icon;
  final VoidCallback onTap;

  const ActionCardMob({
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
        height: 160,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: AppFontSize.titlesmall)),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
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
                    child:  Text(title2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:  const TextStyle(fontSize: AppFontSize.bodysmall2, fontWeight: AppFonts.semiBold)),
                  ),
                ),

                Image.asset(
                  icon,
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

