import 'package:coloring_app_admin_panel/utils/CustomWidgets/custom_textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/padding.dart';
import '../../../constants/size_constant.dart';
import '../../viewmodel/routes/dashboard_controller.dart';
import '../dashboard/activitytable_widget.dart';
import '../widgets/profile_notification_widget.dart';
import '../widgets/title_searchbar_widget.dart';



class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return  Padding(
      padding: AppPadding.globalpadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Align(
              alignment: Alignment.centerRight,
              child: ProfileNotificationWidget()),
          const SizedBox(height: gap5),

          TitleSearchbarWidget(
            controller: controller,
            validator: (p0) {
              return null;
            },
          ),
          const SizedBox(height: gap2),

           const ActivityTable(isDashboard: false,),
        ],
      ),
    );
  }
}


