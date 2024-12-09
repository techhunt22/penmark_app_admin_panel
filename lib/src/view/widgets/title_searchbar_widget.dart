import 'package:coloring_app_admin_panel/utils/CustomWidgets/custom_textfields.dart';
import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../constants/size_constant.dart';
import '../dashboard/activitytable_widget.dart';


class TitleSearchbarWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const TitleSearchbarWidget({super.key, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [

        const Text(
          'Recent Activity',
          style: TextStyle(
              fontSize: AppFontSize.displaysmall, fontWeight: AppFonts.medium),
        ),
        const Spacer(),
        SizedBox(
          width: 398,
          height: 58,
          child: SearchField(
              controller: controller ,
              validator: validator,
              hinttext: "Search..."
          ),
        ),
        const SizedBox(width: gap,),
        CircleAvatar(
          radius: 26.23,
          backgroundColor: Colors.white,
          child: Image.asset("assets/icons/filter.png"),
        ),
      ],
    );
  }
}



