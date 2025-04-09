import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/size_constant.dart';


class PaginationWidget extends StatelessWidget {
  final dynamic controller;
  const PaginationWidget({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {

    return Obx(() {
      if (controller.totalPages.value == null ||
          controller.currentPage.value == null ||
          controller.totalPages.value <= 1) {
        return const SizedBox.shrink(); // Hide pagination if API fails or only 1 page exists
      }

      return Container(
        width: 1550,

        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPaginationButton(
              icon: Icons.arrow_back_outlined,
              isDisabled: controller.currentPage.value == 1,
              onPressed: controller.previousPage,
            ),

            const SizedBox(width: gap,),

            ..._buildSmartPageNumbers(controller),



            const SizedBox(width: gap,),
            _buildPaginationButton(
              icon: Icons.arrow_forward_outlined,
              isDisabled: controller.currentPage.value == controller.totalPages.value,
              onPressed: controller.nextPage,
            ),

          ],
        ),
      );
    });

  }
}


Widget _buildPaginationButton({
  required IconData icon,
  required bool isDisabled,
  required VoidCallback onPressed,
}) {
  return IgnorePointer(
    ignoring: isDisabled,
    child: CircleAvatar(
      backgroundColor: isDisabled ? Colors.grey.withValues(alpha: 0.2) : AppColors.brightblue.withValues(alpha: 0.1),
      radius: 19,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 17, color: isDisabled ? Colors.grey : AppColors.brightblue),
      ),
    ),
  );
}



Widget buildPageNumber(String number, {bool isActive = false, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: isActive ? AppColors.brightblue.withValues(alpha: 0.1) : Colors
              .transparent,
          borderRadius: BorderRadiusDirectional.circular(6)
      ),
      child: Text(number, style: const TextStyle(
          fontSize: AppFontSize.bodysmall2, fontWeight: AppFonts.regular),),
    ),
  );
}


List<Widget> _buildSmartPageNumbers(controller) {
  int currentPage = controller.currentPage.value;
  int totalPages = controller.totalPages.value;
  List<Widget> pages = [];

  void addPage(int page) {
    pages.add(buildPageNumber(
      page.toString(),
      isActive: page == currentPage,
      onTap: () => controller.goToPage(page),
    ));
  }

  void addEllipsis() {
    pages.add(const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text('...', style: TextStyle(fontSize: 16)),
    ));
  }

  if (totalPages <= 8) {
    // Show all if 8 or less
    for (int i = 1; i <= totalPages; i++) {
      addPage(i);
    }
    return pages;
  }

  // Always show first page
  addPage(1);

  if (currentPage > 4) addEllipsis();

  // Middle pages: 2 before to 2 after currentPage
  int start = currentPage - 2;
  int end = currentPage + 2;

  if (start < 2) {
    end += (2 - start);
    start = 2;
  }

  if (end > totalPages - 1) {
    start -= (end - (totalPages - 1));
    end = totalPages - 1;
  }

  start = start < 2 ? 2 : start;
  end = end > totalPages - 1 ? totalPages - 1 : end;

  for (int i = start; i <= end; i++) {
    addPage(i);
  }

  if (currentPage < totalPages - 3) addEllipsis();

  // Always show last page
  addPage(totalPages);

  return pages;
}
