import 'package:flutter/material.dart';

import '../../../../constants/padding.dart';
import '../../../../constants/size_constant.dart';
import '../../widgets/add_widget.dart';
import '../../widgets/profile_notification_widget.dart';
import '../../widgets/title_searchbar_widget.dart';

import 'components/collection_dialog.dart';
import 'components/collection_table_widget.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
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
          AddWidget(
            title: "Add New Collection",
            btntext: "Add New Collection",
            spacing: 1005,
            ontap: () {
              showAddCollectionDialog(context);

            },
          ),
          const SizedBox(height: gap3),
          TitleSearchbarWidget(
            controller: controller,
            title: "Collections List",
            spacing: 815,

            filter: () {},
            validator: (p0) {
              return null;
            },
          ),
          const SizedBox(height: gap2),
           CollectionTableWidget(),
        ],
      ),
    );
  }
}

