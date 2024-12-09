import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/constants/font_family.dart';
import 'package:coloring_app_admin_panel/constants/font_size.dart';
import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:flutter/material.dart';

import '../../widgets/pagination_widget.dart';
import 'dialog_widget.dart';


class TemplateTableWidgets extends StatelessWidget {

  const TemplateTableWidgets({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildHeadingContainer('Template Name', 4),
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildHeadingContainer('Collection', 4),
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildHeadingContainer('Status', 4),
              // Increased flex for description
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildHeadingContainer('Actions', 4),

              // Reduced flex for actions
            ],
          ),
        ),
        const SizedBox(
          height: gap1,
        ),

        buildListView(),

        const SizedBox(height: gap),

        // Pagination
        const PaginationWidget()
      ],
    );
  }


}

ListView buildListView() {
  return ListView.builder(
    itemCount: 6,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Container(
        height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Expanded(
                flex: 4,
                child: Text(
                  "Rose Blossom",
                  maxLines: 4,
                  textAlign: TextAlign.left,
                  // Align text to the left

                  style: TextStyle(
                      fontSize: AppFontSize.bodymedium,
                      fontWeight: AppFonts.regular),
                  overflow: TextOverflow.ellipsis,
                )),

            const SizedBox(width: gap),
            // Add spacing between columns


            // Add spacing between columns
            _buildContainer(
                'Flowers',
               4),
            // Increased flex for description
            const SizedBox(width: gap),
            // Add spacing between columns
            Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 36,
                    constraints: const BoxConstraints(maxWidth: 108),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.brightblue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Active",
                        style: TextStyle(
                          fontSize: AppFontSize.bodysmall2,
                          color: AppColors.black,
                          fontWeight: AppFonts.regular,
                        ),
                      ),
                    ),
                  ),
                ),
            ),




            const SizedBox(width: gap),


            // Add spacing between columns
            Expanded(
                flex: 4,
                child: Row(
                  children: [
                    _buildActionButton(
                        text: "Edit",
                      img: "icons/png/newtab.png",
                      clr: AppColors.purple,
                      ontap: (){
                        showAddTemplateDialog(context, 'Edit Template');

                      }
                    ),
                    const SizedBox(width: 8),
                    _buildActionButton(
                        text: "Delete",
                        clr: AppColors.orangesoft,
                        img: "icons/png/deleteicon.png",
                        ontap: (){
                          showAddTemplateDialog(context, 'Edit Template');

                        }
                    ),
                  ],
                )),
            // Reduced flex for actions
          ],
        ),
      );
    },
  );
}

Widget _buildHeadingContainer(String text, int flex) {
  return Expanded(
    flex: flex,
    child: Text(
      text,
      maxLines: 1,
      textAlign: TextAlign.left, // Align text to the left

      style: const TextStyle(
          fontSize: AppFontSize.bodymedium, fontWeight: AppFonts.bold),
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget _buildContainer(String text, int flex) {
  return Expanded(
    flex: flex,
    child: Text(
      text,
      maxLines: 2,
      textAlign: TextAlign.left, // Align text to the left

      style: const TextStyle(
          fontSize: AppFontSize.bodymedium, fontWeight: AppFonts.regular),
      overflow: TextOverflow.ellipsis,
    ),
  );
}


Widget _buildActionButton({required String text,required VoidCallback ontap, required String img, required Color clr}) {
  return Container(
    constraints: const BoxConstraints(maxWidth: 120),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: AppColors.transparent,
        overlayColor: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        backgroundColor: clr.withOpacity(0.5),
      ),
      onPressed: ontap,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 10,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: AppFontSize.bodysmall2,
              color: AppColors.black,
              fontWeight: AppFonts.regular,
            ),
          ),
          Image.asset(img)
        ],
      ),
    ),
  );
}

void showAddTemplateDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) => AddTemplateDialog(title: text,),
  );
}