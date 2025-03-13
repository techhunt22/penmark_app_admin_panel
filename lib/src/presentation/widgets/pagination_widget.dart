import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/size_constant.dart';


class PaginationWidget extends StatelessWidget {
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1550,

      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildPaginationButton(icon: Icons.arrow_back_outlined),
          const SizedBox(width: gap,),

          buildPageNumber('01', isActive: true),
          buildPageNumber('02'),
          buildPageNumber('03'),
          const Text('...'),
          buildPageNumber('04'),
          buildPageNumber('05'),
          buildPageNumber('06'),


          const SizedBox(width: gap,),
          buildPaginationButton(icon: Icons.arrow_forward_outlined),
        ],
      ),
    );
  }
}



Widget buildPaginationButton({required IconData icon}) {
  return CircleAvatar(
    backgroundColor: AppColors.brightblue.withValues(alpha:0.1),
    radius: 19,
    child:  Icon(icon, size: 17,),
  );
}

Widget buildPageNumber(String number, {bool isActive = false}) {

  return Container(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 15,vertical: 10),
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
        color: isActive ? AppColors.brightblue.withValues(alpha:0.1) : Colors.transparent,
        borderRadius: BorderRadiusDirectional.circular(6)
    ),
    child: Text(number, style: const TextStyle(fontSize: AppFontSize.bodysmall2, fontWeight: AppFonts.regular),),
  );
}