import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/padding.dart';
import '../web/components/statcards_widget.dart';


class TabletWidget extends StatelessWidget {
  const TabletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
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

        Padding(
          padding: AppPadding.globalpadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text("Tablet"),



            ],
          ),
        ),
      ],
    );
  }
}