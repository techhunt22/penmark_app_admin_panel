import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/utils/CustomWidgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/padding.dart';
import '../../../../constants/size_constant.dart';

import '../../controllers/routes/navigation_controller.dart';
import '../../widgets/delete_dialog.dart';
import '../../widgets/pagination_widget.dart';
import '../../widgets/profile_notification_widget.dart';
import '../../widgets/title_searchbar_widget.dart';
import '../../widgets/user_profile_img.dart';

import 'components/orders_widget.dart';
import 'components/recent_activity_widge.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  bool _isEnabled = true;
  bool recentactivity = true;
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();

  }

  void _handleToggle() {
    if (_isEnabled == true) {
      showDeleteDialog(
          context: context,
          text: 'Are you sure you want to suspent this user account?',
          subtitle: 'The user will be suspended.',
          img: 'assets/icons/png/personiconred.png',
          cancel: () {
            Navigator.pop(context);

          },
          save: () {
            Navigator.pop(context);
            setState(() {
              _isEnabled = !_isEnabled;
            });
          });
    }
    else {
      setState(() {
        _isEnabled = !_isEnabled;
      });
    }
  }
  final NavigationController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: AppPadding.globalpadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  dashboardController.goBack();
                },
                child: const Icon(Icons.arrow_back),
              ),
              const Align(
                  alignment: Alignment.centerRight,
                  child: ProfileNotificationWidget()),
            ],
          ),

          const SizedBox(height: gap3),

          Text(
            "User Information",
            style: TextStyle(
                fontSize: AppFontSize.displaysmall,
                fontWeight: AppFonts.medium),
          ),

          const SizedBox(
            height: gap2,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              recentactivityordersWidget(),


              userInfoWidget(),


              actionWidget(context),
            ],
          ),
          const SizedBox(
            height: gap2,
          ),


          TitleSearchbarWidget(
            controller: controller,
            title: recentactivity ? "Recent Activity" :
            "Orders",
            filter: () {

            },
            validator: (p0) {
              return null;
            },
          ),

          const SizedBox(
            height: gap1,
          ),


          recentactivity ?
          RecentActivityWidget():
          OrdersWidget(),

          const SizedBox(height: gap),

          // Pagination
          const PaginationWidget()

        ],
      ),
    );
  }

  Widget actionWidget(BuildContext context) {
    return Container(
              width: 378,
              height: 367,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadiusDirectional.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Administrative Actions Section",
                      style: TextStyle(
                          fontSize: AppFontSize.headlinemedium,
                          fontWeight: AppFonts.regular),
                    ),
                    Text(
                      "Manage user accounts effectively. Key actions include suspending or reactivating users or permanently deleting accounts. ",
                      style: TextStyle(
                          fontSize: AppFontSize.bodysmall2,
                          fontWeight: AppFonts.regular),
                    ),
                    Spacer(),
                    Container(
                      width: 331,
                      height: 54,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: AppColors.lightgray,
                          borderRadius: BorderRadiusDirectional.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status",
                            style: TextStyle(
                                fontSize: AppFontSize.bodysmall2,
                                fontWeight: AppFonts.regular),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                  color:
                                  _isEnabled ? AppColors.brightblue :AppColors.red ,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(6)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    _isEnabled ? "Active" : "Suspended",
                                    style: TextStyle(
                                        fontSize: AppFontSize.bodysmall2,
                                        fontWeight: AppFonts.regular),
                                  ),
                                  Switch(
                                    activeColor: AppColors.white2,
                                     inactiveTrackColor: AppColors.white2.withOpacity(0.8),
                                     inactiveThumbColor: AppColors.white2,
                                     trackOutlineColor: WidgetStatePropertyAll(AppColors.white2),
                                    value: _isEnabled,
                                    onChanged: (_) => _handleToggle(),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: gap,
                    ),
                    Container(
                      width: 331,
                      height: 54,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: AppColors.lightgray,
                          borderRadius: BorderRadiusDirectional.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delete Account",
                            style: TextStyle(
                                fontSize: AppFontSize.bodysmall2,
                                fontWeight: AppFonts.regular),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDeleteDialog(
                                  context: context,
                                  cancel: (){
                                    Navigator.pop(context);
                                  },
                                  save: () {},
                                  text: "Are you sure you want to delete this user account?",
                                  subtitle: "This action cannot be undone.",
                                  img: "assets/icons/png/deleteiconred.png"
                              );
                            },
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                  color:
                                      AppColors.orangesoft.withOpacity(0.5),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(6)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Delete",
                                    style: TextStyle(
                                        fontSize: AppFontSize.bodysmall2,
                                        fontWeight: AppFonts.regular),
                                  ),
                                  Image.asset(
                                      "assets/icons/png/deleteicon.png"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
  }

  Widget userInfoWidget() {
    return Container(
              width: 609,
              height: 367,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadiusDirectional.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserProfileImg(
                        radius: 72,isEdit: false
                      ),
                      SizedBox(
                        width: gap3,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jean-Paul",
                              style: TextStyle(
                                  fontSize: AppFontSize.headlinelarge,
                                  fontWeight: AppFonts.regular),
                            ),
                            SizedBox(height: gap),
                            Row(
                              children: [
                                Image.asset("icons/png/phoneicon.png"),
                                SizedBox(width: gap),
                                Text(
                                  '1-615-330-7656',
                                  style: TextStyle(
                                      color: AppColors.warmgray,
                                      fontSize: AppFontSize.bodymedium,
                                      fontWeight: AppFonts.regular),
                                ),
                                SizedBox(width: gap1),
                                Image.asset("icons/png/mailicon.png"),
                                SizedBox(width: gap),
                                Text(
                                  'jeanpaul@gmail.com',
                                  style: TextStyle(
                                      color: AppColors.warmgray,
                                      fontSize: AppFontSize.bodymedium,
                                      fontWeight: AppFonts.regular),
                                ),
                              ],
                            ),
                            SizedBox(height: gap1),
                            Container(
                              height: 36,
                              width: 108,
                              decoration: BoxDecoration(
                                  color:
                                      AppColors.brightblue.withOpacity(0.5),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(8)),
                              child: Center(child: Text("Active")),
                            ),
                          ]),
                    ],
                  ),
                  SizedBox(height: gap3),
                  Divider(
                    color: AppColors.lightgray,
                    height: 1,
                    thickness: 1,
                    endIndent: 20,
                    indent: 20,
                  ),
                  SizedBox(height: gap1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Shipping Details",
                      style: TextStyle(
                          fontSize: AppFontSize.titlemedium,
                          fontWeight: AppFonts.regular),
                    ),
                  ),
                  SizedBox(height: gap1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Address:",
                      style: TextStyle(
                          fontSize: AppFontSize.bodylarge,
                          color: AppColors.warmgray,
                          fontWeight: AppFonts.regular),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "123 Main St, City, XYZ",
                      style: TextStyle(
                          fontSize: AppFontSize.bodylarge,
                          fontWeight: AppFonts.regular),
                    ),
                  ),
                ],
              ),
            );
  }

  Widget recentactivityordersWidget() {
    return Container(
              width: 478,
              height: 367,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadiusDirectional.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomButton(
                        onPressed: () {
                          setState(() {
                            recentactivity = true;

                          });
                        },
                        text: "Recent Activity",
                        color: AppColors.yellowvibrant,

                        borderradius: 12,
                        height: 66,
                        textcolor: AppColors.black,
                        opacity: 1,
                        width: 338,
                        fontsize: AppFontSize.titlesmall),
                    const SizedBox(
                      height: gap1,
                    ),
                    CustomButton(
                        onPressed: () {
                          setState(() {
                            recentactivity = false;

                          });
                        },
                        text: "Orders",
                        color: AppColors.white,
                        borderradius: 12,
                        textcolor: AppColors.black,
                        opacity: 1,
                        height: 66,
                        width: 338,
                        fontsize: AppFontSize.titlesmall)
                  ],
                ),
              ),
            );
  }
}

void showDeleteDialog(
    {required BuildContext context,
    required VoidCallback cancel,
    required VoidCallback save,
    required String text,
    required String subtitle,
    required String img}) {
  showDialog(
    context: context,
    builder: (context) => DeleteDialog(
      title: text,
      subtitle: subtitle,
      img: img,
      cancel: cancel,
      save: save,
    ),
  );
}
