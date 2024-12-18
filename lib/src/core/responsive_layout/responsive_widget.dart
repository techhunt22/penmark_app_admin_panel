import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget laptop;
  final Widget web;

  const ResponsiveLayout({
    required this.mobile,
    required this.tablet,
    required this.laptop,
    required this.web,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      return mobile; // Mobile layout
    } else if (screenWidth < 1100) {
      return tablet; // Tablet layout
    } else if (screenWidth <= 1400) {
      return laptop; // Laptop layout
    } else {
      return web; // Web layout
    }
  }
}


// enum LayoutType { mobile, tablet, laptop, web }
//
// LayoutType _getLayoutType(double width) {
//   if (width < mobileBreakpoint) {
//     return LayoutType.mobile;
//   } else if (width < tabletBreakpoint) {
//     return LayoutType.tablet;
//   } else if (width <= laptopBreakpoint) { // <= ensures widths up to 1400 trigger laptop
//     return LayoutType.laptop;
//   } else {
//     return LayoutType.web; // Anything greater than 1400 triggers web layout
//   }
// }
