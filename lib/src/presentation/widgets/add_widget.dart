import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';

class AddWidget extends StatelessWidget {
  final String title;
  final String btntext;
  final VoidCallback ontap;
  final double spacing;
  const AddWidget({super.key, required this.title, required this.btntext, required this.ontap, required this.spacing});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusDirectional.circular(12),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(title, style: const TextStyle(

              fontSize: AppFontSize.headlinemedium,fontWeight: AppFonts.medium
          ),),

          SizedBox(width: spacing),

          ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(8))),
                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20,vertical: 20),),
                backgroundColor: const WidgetStatePropertyAll(AppColors.brightblue),
                splashFactory: NoSplash.splashFactory,
                overlayColor: WidgetStatePropertyAll(AppColors.transparent),
              ),

              onPressed: ontap,
              child:  Row(
                children: [
                  const Icon(Icons.add,color: AppColors.white,),
                  Text(btntext, style: const TextStyle(
                      color: AppColors.white,
                      fontSize: AppFontSize.titlesmall,fontWeight: AppFonts.medium
                  ),)
                ],
              )

          )

        ],
      ),
    );
  }
}
