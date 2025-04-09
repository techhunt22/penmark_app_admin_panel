import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';



class HeadingContainer extends StatelessWidget {
  final String text;
  final int flex;
  final bool isCenter;
  const HeadingContainer({super.key, required this.text, required this.flex, required this.isCenter});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Align(
          alignment: isCenter ? Alignment.center : Alignment.centerLeft,
          child: Text(
            text,
            maxLines: 1,
            textAlign: TextAlign.left, // Align text to the left

            style: const TextStyle(
                fontSize: AppFontSize.bodymedium, fontWeight: AppFonts.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}


class HeadingItem {
  final String title;
  final double width;
  final TextAlign textAlign; // for text alignment
  final Alignment alignment; // for container alignment

  HeadingItem({
    required this.title,
    required this.width,
    this.textAlign = TextAlign.center,
    this.alignment = Alignment.center, // default center
  });
}



class HeadingContainer2 extends StatelessWidget {
  final List<HeadingItem> headings;
  const HeadingContainer2({super.key, required this.headings});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 1550,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: headings.map((heading) {
          return Container(
            width: heading.width,
            alignment: heading.alignment, // Align text within the container
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              heading.title,
              textAlign: heading.textAlign, // Align text itself
              style: const TextStyle(
                fontSize: AppFontSize.bodymedium,
                fontWeight: AppFonts.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
      ),
    );
  }
}
