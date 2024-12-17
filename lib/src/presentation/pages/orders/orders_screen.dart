import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/padding.dart';
import '../../../../constants/size_constant.dart';
import '../../../../utils/app_routes.dart';

import '../../controllers/routes/navigation_controller.dart';
import '../../widgets/pagination_widget.dart';
import '../../widgets/profile_notification_widget.dart';
import '../../widgets/title_searchbar_widget.dart';


class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final TextEditingController controller = TextEditingController();
  final NavigationController dashboardController = Get.find();

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
          const Align(
              alignment: Alignment.centerRight,
              child: ProfileNotificationWidget()),

          const SizedBox(height: gap3),

          TitleSearchbarWidget(
            controller: controller,
            title: "Orders Management",
            filter: () {},
            validator: (p0) {
              return null;
            },
          ),

          const SizedBox(height: gap2),
          Container(
            height: 75,
            padding: const EdgeInsets.symmetric( horizontal: 25),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildHeadingContainer('Order ID', 2, false),
                const SizedBox(width: gap),
                // Add spacing between columns
                _buildHeadingContainer('User Name', 4,false),
                const SizedBox(width: gap),
                // Add spacing between columns
                _buildHeadingContainer('Date & Time', 2,false),
                // Increased flex for description
                const SizedBox(width: gap),
                // Add spacing between columns
                _buildHeadingContainer('Item Ordered', 3,true),

                const SizedBox(width: gap),
                // Add spacing between columns
                _buildHeadingContainer('Quantity', 2,true),

                const SizedBox(width: gap),
                // Add spacing between columns
                _buildHeadingContainer('Status', 3,true),
                const SizedBox(width: gap),
                // Add spacing between columns
                _buildHeadingContainer('Actions', 3,true),

                // Reduced flex for actions
              ],
            ),
          ),

          const SizedBox(
            height: gap1,
          ),
          buildListView(dashboardController),

          const SizedBox(height: gap),

          const PaginationWidget()
        ],
      ),
    );
  }
}

Widget buildListView(NavigationController dashboardController) {
  return ListView.builder(
    itemCount: 7,
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
            _buildContainer('1001', 2,false),
            const SizedBox(width: gap),

            const Expanded(
                flex: 4,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 19,
                      backgroundColor: AppColors.purple,
                      child: Text(
                        "JD",
                        style: TextStyle(
                            fontSize: AppFontSize.bodymedium,
                            fontWeight: AppFonts.regular,
                            color: AppColors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "John Doe",
                      maxLines: 4,
                      textAlign: TextAlign.left,
                      // Align text to the left

                      style: TextStyle(
                          fontSize: AppFontSize.bodymedium,
                          fontWeight: AppFonts.regular),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )),


            const SizedBox(width: gap),

            _buildContainer('Nov 20, 2024', 2, false),

            const SizedBox(width: gap),


            _buildContainer('Rose Collection Print', 3,true),

            const  SizedBox(width: gap),

            _buildContainer('1', 2, true),

            const SizedBox(width: gap),

            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 36,
                  constraints: const BoxConstraints(maxWidth: 108),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Completed",
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


            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: Container(
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
                      backgroundColor: AppColors.brightblue.withOpacity(0.2),
                    ),
                    onPressed: (){ 
                      dashboardController.changePage(AppRoutes.usersorderdetail,);},
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      spacing: 10,
                      children: [
                        Text(
                          "View",
                          style: const TextStyle(
                            fontSize: AppFontSize.bodysmall2,
                            color: AppColors.black,
                            fontWeight: AppFonts.regular,
                          ),
                        ),
                        Image.asset("icons/png/newtab.png")
                      ],
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      );
    },
  );
}

Widget _buildHeadingContainer(String text, int flex,bool isCenter) {
  return Expanded(
    flex: flex,
    child: Text(
      text,
      maxLines: 1,
      textAlign:  isCenter ? TextAlign.center : TextAlign.start, // Align text to the left

      style: const TextStyle(
          fontSize: AppFontSize.bodymedium, fontWeight: AppFonts.bold),
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget _buildContainer(String text, int flex, bool isCenter) {
  return Expanded(
    flex: flex,
    child: Align(
      alignment: isCenter ? Alignment.center : Alignment.centerLeft,
      child: Text(
        text,
        maxLines: 2,
        textAlign: TextAlign.left, // Align text to the left

        style: const TextStyle(
            fontSize: AppFontSize.bodymedium, fontWeight: AppFonts.regular),
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}


