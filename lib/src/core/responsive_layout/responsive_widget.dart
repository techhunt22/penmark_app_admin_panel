import 'package:coloring_app_admin_panel/src/core/responsive_layout/responsive_constants.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget laptop;
  final Widget web;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.laptop,
    required this.web,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Using a cached layout type to prevent unnecessary rebuilds
        LayoutType layoutType = _getLayoutType(constraints.maxWidth);

        switch (layoutType) {
          case LayoutType.mobile:
            return mobile;
          case LayoutType.tablet:
            return tablet;
          case LayoutType.laptop:
            return laptop;
          case LayoutType.web:
            return web;
        }
      },
    );
  }
}

enum LayoutType { mobile, tablet, laptop, web }

LayoutType _getLayoutType(double width) {
  if (width < mobileBreakpoint) {
    return LayoutType.mobile;
  } else if (width < tabletBreakpoint) {
    return LayoutType.tablet;
  } else if (width < laptopBreakpoint) {
    return LayoutType.laptop;
  } else {
    return LayoutType.web;
  }
}
