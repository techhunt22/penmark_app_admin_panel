import 'package:coloring_app_admin_panel/utils/CustomWidgets/custom_textfields.dart';
import 'package:flutter/material.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../constants/size_constant.dart';


class TitleSearchbarWidget extends StatelessWidget {
  final String title;
  final VoidCallback filter;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const TitleSearchbarWidget({super.key, required this.controller, this.validator, required this.title, required this.filter});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [

         Text(
          title,
          style: const TextStyle(
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
        GestureDetector(
          onTap: filter,
          child: CircleAvatar(
            radius: 26.23,
            backgroundColor: Colors.white,
            child: Image.asset("assets/icons/png/filter.png"),
          ),
        ),
      ],
    );
  }
}



