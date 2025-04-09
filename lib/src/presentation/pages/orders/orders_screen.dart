
import 'package:flutter/material.dart';
import '../../../../constants/padding.dart';
import '../../../../constants/size_constant.dart';
import '../../widgets/profile_notification_widget.dart';
import '../../widgets/title_searchbar_widget.dart';
import 'components/orders_table_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final TextEditingController controller = TextEditingController();




  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.globalpadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 1347,),
              ProfileNotificationWidget(),
            ],
          ),
          const SizedBox(height: gap3),
          TitleSearchbarWidget(
            controller: controller,
            title: "Orders Management",
            filter: () {},
            spacing: 704,

            validator: (p0) {
              return null;
            },
          ),
          const SizedBox(height: gap2),


          OrdersTableWidget(),


        ],
      ),
    );
  }




}



