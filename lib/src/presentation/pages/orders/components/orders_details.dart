import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/padding.dart';
import '../../../../../constants/size_constant.dart';
import '../../../controllers/routes/navigation_controller.dart';
import '../../../widgets/profile_notification_widget.dart';
import '../../../widgets/user_profile_img.dart';


class OrderDetailScreen extends StatelessWidget {

  const OrderDetailScreen({super.key,  });


  @override
  Widget build(BuildContext context) {

    final NavigationController dashboardController = Get.find();

    return Padding(
        padding: AppPadding.globalpadding,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  dashboardController.goBack();
                },
                child: const Icon(Icons.arrow_back),
              ),

                  SizedBox(width: 1323,),
                  ProfileNotificationWidget(),
            ],
          ),
          const SizedBox(height: gap3),

          Text(
            "Test",
            style: TextStyle(
                fontSize: AppFontSize.displaysmall,
                fontWeight: AppFonts.medium),
          ),
          const SizedBox(
            height: gap2,
          ),

          Container(
            width: 1550,

            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
            decoration: BoxDecoration(
                color: AppColors.white,

                borderRadius: BorderRadiusDirectional.circular(12)
            ),            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      UserProfileImg(
                        radius: 72,isEdit: false
                      ),
                      SizedBox(
                        height: gap1,
                      ),
                      Text(
                        "Jean-Paul",
                        style: TextStyle(
                            fontSize: AppFontSize.headlinelarge,
                            fontWeight: AppFonts.regular),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Image.asset("icons/png/phoneicon.png"),
                          SizedBox(width: gap),
                          Text(
                            '1-615-330-7656',
                            style: TextStyle(
                                color: AppColors.warmgray,
                                fontSize: AppFontSize.bodymedium,
                                fontWeight: AppFonts.regular),
                          ),

                        ],
                      ),
                      SizedBox(height: 5),

                      Row(
                        children: [
                          Image.asset("icons/png/mailicon.png"),
                          SizedBox(width: gap),
                          Text(
                            'jeanpaul@gmail.com',
                            style: TextStyle(
                                color: AppColors.warmgray,
                                fontSize: AppFontSize.bodymedium,
                                fontWeight: AppFonts.regular),
                          ),

                        ],
                      ),
                    ]
                ),
              ),



              Container(
                width: 1152,
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.lightgray,
                        width: 1
                    ),
                    borderRadius: BorderRadiusDirectional.circular(12)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                        child: Image.asset("images/sketch.png")),
                    SizedBox(width: gap3,),

                    SizedBox(
                      width: 320,

                      child: Column(
                        children: [
                          _buildDetailRow('Name:', 'Jean-Paul'),
                          const SizedBox(height: gap),
                          _buildDetailRow('Address:', '123 Main St, City, XYZ'),
                          const SizedBox(height: gap),
                          _buildDetailRow('Payment method:', 'Mastercard'),
                          const SizedBox(height: gap),
                          _buildDetailRow('Delivery Date:', '2024-09-24'),
                          const SizedBox(height: gap),
                          _buildDetailRow('Order ID:', '#12345'),
                          const SizedBox(height: gap),
                          _buildDetailRow('Created at:', '2024-09-20'),
                          const SizedBox(height: gap),
                          _buildDetailRow('Items:', ' Spring Blossoms (Print)'),
                          const SizedBox(height: gap),
                          _buildDetailRow('Size:', 'A4'),
                          const SizedBox(height: gap),
                          _buildDetailRow('Paper Type:', 'Matte'),
                          const SizedBox(height: gap),
                          _buildDetailRow('Quantity:', '2'),
                          const SizedBox(height: gap),
                          _buildDetailRow('Total Amount:', '\$45.00'),
                          const SizedBox(height: gap2),

                        ],
                      ),
                    ),
                    SizedBox(width: gap3,),

                    SizedBox(
                      width: 320,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Order Timeline", style: TextStyle(
                              fontSize: AppFontSize.titlelarge,fontWeight: AppFonts.regular
                          ),),
                          const SizedBox(height: gap2),

                          _buildDetailRow('Order Received:', '2024-09-20'),
                          const SizedBox(height: gap),
                          _buildDetailRow('Delivered:', '2024-09-21'),
                          const SizedBox(height: gap2),


                          Text("Shipping Details", style: TextStyle(
                            fontSize: AppFontSize.titlelarge,fontWeight: AppFonts.regular,
                          ),),
                          const SizedBox(height: gap2),
                          Text("Address:", style: TextStyle(
                              fontSize: AppFontSize.bodylarge,fontWeight: AppFonts.regular,color: AppColors.warmgray
                          ),),
                          Text("123 Main St, City, XYZ", style: TextStyle(
                            fontSize: AppFontSize.bodylarge,fontWeight: AppFonts.regular,
                          ),),

                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
          )



        ]
        )
    );
  }
}


Widget _buildDetailRow(String label, String value) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Align to top for multi-line text

        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AppColors.warmgray,
                  fontSize: AppFontSize.bodylarge,
                  fontWeight: AppFonts.regular),
            ),
          ),
          Expanded(
            flex: 7,
            child: Align(
              alignment: Alignment.topRight, // Align content to top-right
              child: Text(
                value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: AppFontSize.bodylarge,
                    fontWeight: AppFonts.regular),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Container(
        height: 1,
        color: AppColors.lightgray,
      ),
    ],
  );
}
