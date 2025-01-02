

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../utils/CustomWidgets/custom_buttons.dart';
import '../../../../../utils/app_routes.dart';
import '../../../controllers/routes/navigation_controller.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController dashboardController = Get.find();

    return SizedBox(
      width: 1550,
      child: ListView.builder(
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
                    child: CustomTextIconButton(
                        onPressed: (){
                          dashboardController.changePage(AppRoutes.usersorderdetail,);
                        },
                        height: 45,
                        width: 120,
                        text:  "View Details",
                        color:  AppColors.brightblue,
                        borderradius: 8,
                        fontsize: AppFontSize.bodysmall2,
                        textcolor:AppColors.black,
                        opacity: 0.2,
                        img: "icons/png/newtab.png"
                    ),



                  ),

                ),
              )
          );
        },
      ),
    );
  }
}
