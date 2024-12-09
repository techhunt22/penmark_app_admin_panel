import 'package:coloring_app_admin_panel/constants/font_family.dart';
import 'package:coloring_app_admin_panel/constants/font_size.dart';
import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final double width;
  final String title;
  final String value;
  final Color color;
  final String icon;

  const StatsCard({
    super.key,
    required this.width,
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        width: width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(value,
                    style: const TextStyle(
                        fontSize: AppFontSize.headlinelarge, fontWeight: AppFonts.semiBold)),
                const SizedBox(height: 8),

                Text(title, style: const TextStyle(fontSize: AppFontSize.titlemedium, fontWeight: AppFonts.regular)),
              ],
            ),
            Image.asset(
              icon,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
