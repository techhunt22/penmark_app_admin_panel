import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:flutter/material.dart';

class UserProfileImg extends StatelessWidget {
  final double radius;
  final bool isEdit ;
  const UserProfileImg( {super.key, required this.radius, required this.isEdit,});

  @override
  Widget build(BuildContext context) {
    return   Stack(

      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage("images/profileimg.png"),

        ),
        isEdit  ? Positioned(
            bottom: 10,
            right:5,
            child: CircleAvatar(
              radius: 18,
                backgroundColor: AppColors.purple,
                child: Center(child: Image.asset("icons/png/editicon.png", color: AppColors.white)))):
            SizedBox.shrink()
      ]
    );
  }
}
