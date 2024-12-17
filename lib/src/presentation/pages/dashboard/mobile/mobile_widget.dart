import 'package:flutter/material.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/padding.dart';
import '../../../../../constants/size_constant.dart';
import '../web/components/statcards_widget.dart';


class MobileWidget extends StatelessWidget {
  const MobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Text(
            'Admin Dashboard',
            style: TextStyle(
                fontSize: AppFontSize.displaysmall, fontWeight: AppFonts.medium),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(

              children: [
                StatsCard(
                  width: 117,
                  height: 117,
                  iconheight: 25,
                  titlesize: AppFontSize.titlesmall,
                  subtitlesize: AppFontSize.bodysmall2,
                  title: 'Total Users',
                  value: '12,340',
                  color: AppColors.brightblue.withOpacity(0.5),
                  icon: "icons/png/totalusers.png",
                ),
                const SizedBox(width: gap1,),
                StatsCard(
                  width: 117,
                  height: 117,
                  iconheight: 25,
                  titlesize: AppFontSize.titlesmall,
                  subtitlesize: AppFontSize.bodysmall2,
                  title: 'Templates',
                  value: '320',
                  color: AppColors.purple.withOpacity(0.5),
                  icon: "icons/png/palette.png",
                ),
                const SizedBox(width: gap1,),

                StatsCard(
                  width: 117,
                  height: 117,
                  iconheight: 25,
                  titlesize: AppFontSize.titlesmall,
                  subtitlesize: AppFontSize.bodysmall2,
                  title: 'Collections',
                  value: '45',
                  color: AppColors.yellowvibrant.withOpacity(0.5),
                  icon: "icons/png/collection.png",
                ),
                const SizedBox(width: gap1,),

                StatsCard(
                  width: 140,
                  height: 117,
                  iconheight: 25,
                  titlesize: AppFontSize.titlesmall,
                  subtitlesize: AppFontSize.bodysmall2,
                  title: 'Pending Orders',
                  value: '15',
                  color: AppColors.orangesoft.withOpacity(0.5),
                  icon: "icons/png/pendingorder.png",
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: AppPadding.globalpadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text("Mobile"),



            ],
          ),
        ),
      ],
    );
  }
}