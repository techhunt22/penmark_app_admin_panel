import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_size.dart';
import '../../../utils/CustomWidgets/custom_buttons.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final String img;
  final Color clr;
  const ActionButton({super.key, required this.text, required this.ontap, required this.img, required this.clr});

  @override
  Widget build(BuildContext context) {
    return  Container(
        constraints: const BoxConstraints(maxWidth: 120),
        child: CustomTextIconButton(
            onPressed: ontap,
            height: 45,
            width: 115,
            text: text,
            color: clr,
            borderradius: 8,
            fontsize: AppFontSize.bodysmall2,
            textcolor: AppColors.black,
            opacity: 0.5,
            img: img
        )


    );
  }
}
