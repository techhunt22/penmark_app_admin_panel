import 'package:flutter/material.dart';
import '../../../constants/padding.dart';
import '../../../constants/size_constant.dart';
import '../widgets/add_widget.dart';
import '../widgets/profile_notification_widget.dart';
import '../widgets/title_searchbar_widget.dart';
import 'components/dialog_widget.dart';
import 'components/template_table_widgets.dart';

class TemplatesScreen extends StatefulWidget {
  const TemplatesScreen({super.key});

  @override
  State<TemplatesScreen> createState() => _TemplatesScreenState();
}

class _TemplatesScreenState extends State<TemplatesScreen> {

  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: AppPadding.globalpadding,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
                alignment: Alignment.centerRight,
                child: ProfileNotificationWidget()),

             const SizedBox(height: gap3),


             AddWidget(
              title: "Add New Template",
              btntext: "Add New Template",
              ontap: (){
                showAddTemplateDialog(context, 'Add New Template');
              },
            ),

            const SizedBox(height: gap3),

            TitleSearchbarWidget(
              controller: controller,
              title: "Manage Templates",
              validator: (p0) {
                return null;
              },
            ),


            const SizedBox(height: gap2),

            const TemplateTableWidgets(),


      ],

    ),

        );
  }
}
void showAddTemplateDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) => AddTemplateDialog(title: text,),
  );
}