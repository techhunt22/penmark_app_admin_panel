

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../utils/app_routes.dart';
import '../../../controllers/routes/navigation_controller.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController dashboardController = Get.find();

    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {



        return Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Container(
              height: 68,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadiusDirectional.circular(8)),
              child: ListTile(
                contentPadding: EdgeInsets.zero,

                leading: Container(
                  padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.yellowvibrant.withOpacity(0.5),
                      borderRadius: BorderRadiusDirectional.circular(10)
                    ),
                    child: Text("Order # 102410")),
                title: Text(
                  "Rose Collection Print,  Nov 20, 2024, ",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: AppFonts.regular, fontSize: AppFontSize.bodysmall2),
                ),
                subtitle:Text(
                 "Quantity : 1",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: AppFonts.regular, fontSize: AppFontSize.bodysmall2),
                ),
                trailing: Container(
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
                      backgroundColor:AppColors.brightblue.withOpacity(0.2),
                    ),
                    onPressed: (){
                      dashboardController.changePage(AppRoutes.usersorderdetail,);
                    },
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      spacing: 10,
                      children: [
                        Text(
                          "View Details",
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
            )
        );
      },
    );
  }
}
