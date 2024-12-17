import 'package:coloring_app_admin_panel/src/core/responsive_layout/responsive_widget.dart';
import 'package:coloring_app_admin_panel/src/presentation/pages/dashboard/tablet/tablet_widget.dart';
import 'package:coloring_app_admin_panel/src/presentation/pages/dashboard/web/web_widget.dart';
import 'package:flutter/material.dart';

import 'laptop/laptop_widget.dart';
import 'mobile/mobile_widget.dart';



class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobile: MobileWidget(),
        tablet: TabletWidget(),
        laptop: LaptopWidget(),
        web: DashboardWebWidget()
    );
  }
}





