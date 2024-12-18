import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/constants/font_family.dart';
import 'package:coloring_app_admin_panel/constants/font_size.dart';
import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/CustomWidgets/custom_buttons.dart';
import '../../../widgets/delete_dialog.dart';
import '../../../widgets/pagination_widget.dart';

import 'collection_dialog.dart';


class CollectionTableWidget extends StatelessWidget {

  const CollectionTableWidget({super.key,});

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
              _buildHeadingContainer('Collection Name', 4, false),
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildHeadingContainer('Number of Templates', 4,false),
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildHeadingContainer('Status', 4,false),
              // Increased flex for description
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildHeadingContainer('Actions', 4,true),

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
                '12',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton(
                        text: "Edit",
                        img: "icons/png/newtab.png",
                        clr: AppColors.purple,
                        ontap: (){
                          showCollectionDialog(context, 'Edit Collection');

                        }
                    ),
                    const SizedBox(width: 8),
                    _buildActionButton(
                        text: "Delete",
                        clr: AppColors.orangesoft,
                        img: "icons/png/deleteicon.png",
                        ontap: (){
                          showDeleteDialog(
                             context: context,
                              text: 'Delete Collection',
                            subtitle: 'Are you sure you want to delete this collection? This will permanently remove all associated templates and cannot be undone.',
                              img: "icons/png/deleteiconred.png",
                            cancel: (){
                              Navigator.pop(context);
                            },
                            save: (){}

                          );

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

Widget _buildHeadingContainer(String text, int flex, bool isCenter) {
  return Expanded(
    flex: flex,
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
      child: CustomTextIconButton(
          onPressed: ontap,
          height:45 ,
          width: 115,
          text:  text,
          color: clr,
          borderradius: 8,
          fontsize:  AppFontSize.bodysmall2,
          textcolor:AppColors.black,
          opacity: 0.5,
          img: img
      )



  );
}


void showCollectionDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) => CollectionDialog(title: text,),
  );
}



void showDeleteDialog({required BuildContext context, required VoidCallback cancel,required VoidCallback save,required String text,required String subtitle,required String img}) {
  showDialog(
    context: context,
    builder: (context) => DeleteDialog(
      title: text,
      subtitle: subtitle,
      img: img,cancel: cancel,save: save,

    ),
  );
}