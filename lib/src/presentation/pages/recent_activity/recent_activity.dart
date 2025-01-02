import 'package:flutter/material.dart';
import '../../../../constants/padding.dart';
import '../../../../constants/size_constant.dart';
import '../../widgets/profile_notification_widget.dart';
import '../../widgets/title_searchbar_widget.dart';
import '../dashboard/components/activitytable_widget.dart';

class RecentActivity extends StatefulWidget {
  const RecentActivity({super.key});

  @override
  State<RecentActivity> createState() => _RecentActivityState();
}

class _RecentActivityState extends State<RecentActivity> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.globalpadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 1347,),
              ProfileNotificationWidget(),
            ],
          ),
          const SizedBox(height: gap3),

          TitleSearchbarWidget(
            controller: controller,
            title: "Recent Activity",
            filter: () {},
            spacing: 815,
            validator: (p0) {
              return null;
            },
          ),
          const SizedBox(height: gap2),

          const ActivityTable(
            isDashboard: false,
          ),
        ],
      ),
    );
  }
}
