import 'package:flutter/material.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';



class RecentActivityWidget extends StatelessWidget {
  const RecentActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        List text = [
          "Your recent print order is now being processed.",
          "You saved a new template: lorem ipsum.",
          "You saved a new template: lorem ipsum.","You saved a new template: lorem ipsum.",
          "You saved a new template: lorem ipsum.","You saved a new template: lorem ipsum.",
          "You saved a new template: lorem ipsum.","You saved a new template: lorem ipsum.",
          "You saved a new template: lorem ipsum.","You saved a new template: lorem ipsum.",
          "You saved a new template: lorem ipsum.","You saved a new template: lorem ipsum.",
          "You saved a new template: lorem ipsum.","You saved a new template: lorem ipsum.",
          "You saved a new template: lorem ipsum.","You saved a new template: lorem ipsum.",
          "You saved a new template: lorem ipsum.",
        ];
        List color = [
          AppColors.purple,
          AppColors.yellowvibrant,
          AppColors.orangesoft,  AppColors.yellowvibrant,
          AppColors.orangesoft,  AppColors.yellowvibrant,
          AppColors.orangesoft,  AppColors.yellowvibrant,
          AppColors.orangesoft,  AppColors.yellowvibrant,
          AppColors.orangesoft,  AppColors.yellowvibrant,
          AppColors.orangesoft,  AppColors.yellowvibrant,
          AppColors.orangesoft,
        ];

        return Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Container(
              height: 68,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadiusDirectional.circular(8)),
              child: Center(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 46,
                    height: 43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(8),
                      color: color[index].withOpacity(0.5),
                    ),
                    child: Image.asset(
                      "icons/png/recentactivity.png",
                      fit: BoxFit.scaleDown,
                      color: AppColors.black,
                    ),
                  ),
                  title: Text(
                    text[index],
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: AppFonts.regular, fontSize: AppFontSize.bodysmall2),
                  ),
                ),
              ),
            )
        );
      },
    );
  }
}
