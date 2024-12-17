import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import 'user_profile_img.dart';


class ProfileNotificationWidget extends StatelessWidget {
  const ProfileNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 0,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(12)),
        child:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              UserProfileImg(
                radius: 21,
                isEdit: false,
              ),

              SizedBox(width: 10),
              Text(
                'Lorem ipsum',
                style: TextStyle(
                    fontSize: AppFontSize.bodymedium,
                    fontWeight: AppFonts.regular,
                    color: AppColors.warmgray),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



