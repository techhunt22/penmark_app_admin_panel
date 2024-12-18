import 'package:coloring_app_admin_panel/constants/font_family.dart';
import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatsCardMob extends StatelessWidget {
  final double width;
  final double height;
  final double titlesize;
  final double subtitlesize;
  final String title;
  final String value;
  final Color color;
  final String icon;
  final double iconheight;

  const StatsCardMob({
    super.key,
    required this.width,
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
    required this.titlesize,
    required this.subtitlesize,
    required this.iconheight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: iconheight,
          ),
          const SizedBox(height: gap),
          Text(value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: titlesize, fontWeight: AppFonts.semiBold)),
          Text(title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: subtitlesize, fontWeight: AppFonts.regular)),
        ],
      ),
    );
  }
}
