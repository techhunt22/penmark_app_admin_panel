import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/size_constant.dart';
import '../../../../../utils/CustomWidgets/custom_buttons.dart';
import '../../../../../utils/app_routes.dart';
import '../../../../data/datasource/orders/get_orders_datasource.dart';
import '../../../../data/repositories_impl/orders/get_orders_repo_impl.dart';
import '../../../../domain/usecases/orders/get_orders_usecase.dart';
import '../../../controllers/orders/getorders/get_orders_controller.dart';
import '../../../controllers/orders/getorders/orders_cache.dart';
import '../../../controllers/routes/navigation_controller.dart';
import '../../../widgets/body_container.dart';
import '../../../widgets/heading_container.dart';
import '../../../widgets/pagination_widget.dart';

class OrdersTableWidget extends StatelessWidget {

  OrdersTableWidget({super.key,});

  final orderController = Get.put(GetOrdersController(
      GetOrdersUseCase(GetOrdersRepoImpl(GetOrdersDataImpl())),
      OrdersCache()));
  final NavigationController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          height: 75,
          width: 1550,

          padding: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HeadingContainer(text: 'Order ID',flex:  3,isCenter:  false),
              HeadingContainer(text: 'User Name', flex: 3,isCenter:  false),
              HeadingContainer(text: 'Date & Time', flex: 2, isCenter: false),
              HeadingContainer(text: 'Item Ordered', flex: 3, isCenter: false),
              HeadingContainer(text: 'Quantity',flex:  2, isCenter: false),
              HeadingContainer(text: 'Status',flex:  3, isCenter: false),
              HeadingContainer(text: 'Actions',flex: 3, isCenter: false),

              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    orderController.refreshData();
                  },
                  icon: Icon(Icons.refresh_outlined),),
              )
            ],
          ),
        ),

        const SizedBox(
          height: gap1,
        ),

        buildListView(dashboardController),

        const SizedBox(height: gap),


        PaginationWidget(controller: orderController,)
      ],
    );
  }

  Widget buildListView(NavigationController dashboardController) {
    return SizedBox(
      width: 1550,

      child: Obx(() {

        if (orderController.isLoading.value) {
          return Skeletonizer(

            child: ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  height: 75,
                  width: 1550,

                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      BodyContainer(text: '101515151501',flex:  3, ),
                      const Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 19,
                                child: Text(
                                  "JD",
                                  style: TextStyle(
                                      fontSize: AppFontSize.bodymedium,
                                      fontWeight: AppFonts.regular,
                                      color: AppColors.white
                                  ),
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
                      BodyContainer(text: 'Nov 20, 2024', flex: 2, ),
                      BodyContainer(text: 'Rose Collection Print',flex:  3, ),
                      BodyContainer(text: '1', flex: 2,),
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 36,
                            width: 108,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
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
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 120,
                            child: CustomTextIconButton(
                                onPressed: () {
                                  dashboardController.changePage(
                                    AppRoutes.usersorderdetail,
                                  );
                                },
                                height: 45,
                                width: 120,
                                text: "View",
                                color: AppColors.brightblue,
                                borderradius: 8,
                                fontsize: AppFontSize.bodysmall2,
                                textcolor: AppColors.black,
                                opacity: 0.2,
                                img: "icons/png/newtab.png"),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: SizedBox()
                      ),

                    ],
                  ),
                );
              },
            ),
          );
        }

        if (orderController.errorMessage.isNotEmpty) {
          return Center(child: Text(orderController.errorMessage.value));
        }



        return ListView.builder(
          itemCount: orderController.orders.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final orders = orderController.orders[index];
            //final name = orderController.getInitials(orders.);
            final date = orderController.getDate(orders.createdAt);

            return Container(
              height: 75,
              width: 1550,

              padding: const EdgeInsets.symmetric(horizontal: 25),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BodyContainer(text: orders.orderId,flex: 3,),

                  const Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 19,
                            backgroundColor: AppColors.purple,
                            child: Text(
                              "Null",
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
                  BodyContainer(text: date, flex: 2,),
                  BodyContainer(text: orders.itemsOrdered, flex: 3,),
                  BodyContainer(text: "${orders.quantity}", flex: 2,),

                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 36,
                        width: 108,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: orders.status == "completed"
                              ? AppColors.green.withValues(alpha: 0.2)
                              : orders.status == "pending"
                              ? AppColors.orangesoft.withValues(alpha:0.2)
                              : AppColors.red.withValues(alpha:0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:  Center(
                          child: Text(
                            orders.status,
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

                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 120,
                        child: CustomTextIconButton(
                            onPressed: () {
                              dashboardController.changePage(
                                AppRoutes.usersorderdetail,

                              );
                            },
                            height: 45,
                            width: 120,
                            text: "View",
                            color: AppColors.brightblue,
                            borderradius: 8,
                            fontsize: AppFontSize.bodysmall2,
                            textcolor: AppColors.black,
                            opacity: 0.2,
                            img: "icons/png/newtab.png"),
                      ),
                    ),
                  ),

                  Expanded(
                      flex: 1,
                      child: SizedBox()
                  ),

                ],
              ),
            );
          },
        );
      }),
    );
  }

}
