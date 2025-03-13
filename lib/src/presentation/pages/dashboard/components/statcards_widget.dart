import 'package:coloring_app_admin_panel/constants/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatsCardWeb extends StatelessWidget {
  final double width;
  final double height;
  final double titlesize;
  final double subtitlesize;
  final String title;
  final String value;
  final Color color;
  final String icon;
  final double iconheight;

  const StatsCardWeb({
    super.key,
    required this.width,
    required this.title,
    required this.value,
    required this.color,
    required this.icon, required this.titlesize, required this.subtitlesize, required this.iconheight, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withValues(alpha:0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Wrap(
        runAlignment: WrapAlignment.center,
        runSpacing: 5,
        spacing: 5,
        alignment: WrapAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(value,
                  style:  TextStyle(
                      fontSize: titlesize, fontWeight: AppFonts.semiBold)),
              const SizedBox(height: 8),

              Text(title, style:  TextStyle(fontSize: subtitlesize, fontWeight: AppFonts.regular)),
            ],
          ),

          SvgPicture.asset(
            icon,
            height: iconheight,
          ),
        ],
      ),
    );
  }
}
