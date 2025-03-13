import 'package:coloring_app_admin_panel/utils/CustomWidgets/custom_textfields.dart';
import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/padding.dart';
import '../../../../constants/size_constant.dart';
import '../../../../utils/CustomWidgets/custom_buttons.dart';
import '../../widgets/profile_notification_widget.dart';
import '../../widgets/user_profile_img.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController printsize = TextEditingController();
  final TextEditingController price = TextEditingController();

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
          Text(
            "Settings",
            style: TextStyle(
                fontSize: AppFontSize.displaysmall,
                fontWeight: AppFonts.medium),
          ),
          const SizedBox(
            height: gap2,
          ),
          Wrap(
            spacing: 50,
            runSpacing: 20,

            children: [
              generalSettingWidget(),
              printSizeWidget(),
              printPaperTypeWidget(),
            ],
          ),
          const SizedBox(
            height: gap2,
          ),
          chargesWidget(),
        ],
      ),
    );
  }

  Widget generalSettingWidget() {
    return Container(
      width: 423,
      height: 600,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusDirectional.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "General Settings",
              style: TextStyle(
                  fontSize: AppFontSize.titlelarge,
                  fontWeight: AppFonts.medium),
            ),
            SizedBox(
              height: gap3,
            ),
            UserProfileImg(
              radius: 72,
              isEdit: true,
            ),
            SizedBox(height: gap2),
            EditProfileField(
              controller: controller,
              validator: (p0) {
                return null;
              },
              hinttext: "Lorem Ipsum",
              title: "Full Name",
              titleon: true,
              icon1: "icons/png/personicon.png",
            ),
            SizedBox(height: gap2),
            EditProfileField(
              controller: controller,
              validator: (p0) {
                return null;
              },
              hinttext: "1-615-330-7656",
              title: "Contact Number",
              titleon: true,
              icon1: "icons/png/phoneicon.png",
            ),
            SizedBox(height: gap2),
            EditProfileField(
              controller: controller,
              validator: (p0) {
                return null;
              },
              hinttext: "jeanpaul@gmail.com",
              title: "Contact Email",
              titleon: true,
              icon1: "icons/png/mailicon.png",
            ),
          ],
        ),
      ),
    );
  }

  Widget printSizeWidget() {
    return Container(
        width: 491,
        height: 600,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadiusDirectional.circular(12),
        ),
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Text(
                "Print Size",
                style: TextStyle(
                    fontSize: AppFontSize.titlelarge,
                    fontWeight: AppFonts.medium),
              ),
              SizedBox(
                height: gap3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PrintTextField(
                    controller: printsize,
                    validator: (p0) {
                      return null;
                    },
                    hinttext: "Size",
                    title: "Sizes",
                    titleon: true,
                    isDollar: false,
                    width: 156,
                    readonly: false,
                    textinputtype: TextInputType.number,
                  ),
                  PrintTextField(
                    controller: price,
                    validator: (p0) {
                      return null;
                    },
                    hinttext: "",
                    title: "Price",
                    titleon: true,
                    textinputtype: TextInputType.number,
                    width: 156,
                    isDollar: true,
                    readonly: false,
                  ),


                  CustomIconButton(
                    color: AppColors.yellowvibrant,
                    img: "icons/png/addicon.png",
                    onPressed: (){},
                  ),

                  ElevatedButton(
                    style: ButtonStyle(
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 20, horizontal: 0)),
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.white),
                        splashFactory: NoSplash.splashFactory,
                        shadowColor: WidgetStatePropertyAll(Colors.transparent),
                        overlayColor:
                            WidgetStatePropertyAll(AppColors.transparent),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                    onPressed: () {},
                    child: null,
                  ),
                ],
              ),
              SizedBox(
                height: gap2,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PrintTextField(
                            controller: controller2,
                            validator: (p0) {
                              return null;
                            },
                            hinttext: "Size",
                            width: 156,
                            title: "Sizes",
                            titleon: index == 0 ? true : false,
                            isDollar: false,
                            readonly: false,
                            textinputtype: TextInputType.number,
                          ),
                          PrintTextField(
                            controller: price,
                            validator: (p0) {
                              return null;
                            },
                            hinttext: "",
                            textinputtype: TextInputType.number,
                            width: 156,
                            title: "Price",
                            titleon: index == 0 ? true : false,
                            isDollar: true,
                            readonly: false,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          iconButtonIWidget(
                              "icons/png/updateicon.png", AppColors.purple, (){}),
                          const SizedBox(
                            width: 5,
                          ),
                          iconButtonIWidget(
                              "icons/png/deleteicon.png", AppColors.orangesoft, (){})
                        ],
                      ),
                    );
                  },
                ),
              )
            ])));
  }

  Widget printPaperTypeWidget() {
    return Container(
        width: 491,
        height: 600,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadiusDirectional.circular(12),
        ),
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Text(
                "Print Paper type",
                style: TextStyle(
                    fontSize: AppFontSize.titlelarge,
                    fontWeight: AppFonts.medium),
              ),
              SizedBox(
                height: gap3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PrintTextField(
                    controller: printsize,
                    validator: (p0) {
                      return null;
                    },
                    hinttext: "Paper Type",
                    title: "Paper Type",
                    titleon: true,
                    width: 156,
                    isDollar: false,
                    textinputtype: TextInputType.number,
                    readonly: false,
                  ),
                  PrintTextField(
                    controller: price,
                    validator: (p0) {
                      return null;
                    },
                    hinttext: "",
                    title: "Price",
                    width: 156,
                    textinputtype: TextInputType.number,
                    titleon: true,
                    isDollar: true,
                    readonly: false,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                              vertical: 20, horizontal: 0)),
                          backgroundColor:
                              WidgetStatePropertyAll(AppColors.yellowvibrant),
                          splashFactory: NoSplash.splashFactory,
                          shadowColor:
                              WidgetStatePropertyAll(Colors.transparent),
                          overlayColor:
                              WidgetStatePropertyAll(AppColors.transparent),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )),
                      onPressed: () {},
                      child: Image.asset("icons/png/addicon.png")),
                  ElevatedButton(
                    style: ButtonStyle(
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 20, horizontal: 0)),
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.white),
                        splashFactory: NoSplash.splashFactory,
                        shadowColor: WidgetStatePropertyAll(Colors.transparent),
                        overlayColor:
                            WidgetStatePropertyAll(AppColors.transparent),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                    onPressed: () {},
                    child: null,
                  ),
                ],
              ),
              SizedBox(
                height: gap2,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PrintTextField(
                            controller: controller2,
                            validator: (p0) {
                              return null;
                            },
                            hinttext: "Paper Type",
                            title: "Paper Type",
                            titleon: index == 0 ? true : false,
                            textinputtype: TextInputType.number,
                            isDollar: false,
                            readonly: false,
                            width: 156,
                          ),
                          PrintTextField(
                            controller: price,
                            validator: (p0) {
                              return null;
                            },
                            hinttext: "",
                            textinputtype: TextInputType.number,
                            width: 156,
                            title: "Price",
                            titleon: index == 0 ? true : false,
                            isDollar: true,
                            readonly: false,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          iconButtonIWidget(
                              "icons/png/updateicon.png", AppColors.purple, (){}),
                          const SizedBox(
                            width: 5,
                          ),
                          iconButtonIWidget(
                              "icons/png/deleteicon.png", AppColors.orangesoft, (){}),
                        ],
                      ),
                    );
                  },
                ),
              )
            ])));
  }

  Widget chargesWidget() {
    return Container(
        width: 991,
        height: 200,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadiusDirectional.circular(12),
        ),
        child: Padding(
            padding: EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Charges",
                style: TextStyle(
                    fontSize: AppFontSize.titlelarge,
                    fontWeight: AppFonts.medium),
              ),
              SizedBox(
                height: gap3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PrintTextField(
                    controller: printsize,
                    validator: (p0) {
                      return null;
                    },
                    hinttext: "",
                    title: "Tax",
                    titleon: true,
                    isDollar: true,
                    textinputtype: TextInputType.number,
                    width: 281,
                    readonly: false,
                  ),
                  iconButtonIWidget(
                      "icons/png/updateicon.png", AppColors.purple, (){}),
                  const SizedBox(
                    width: 5,
                  ),
                  iconButtonIWidget(
                      "icons/png/deleteicon.png", AppColors.orangesoft, (){}),


                  SizedBox(width: gap5,),


                  PrintTextField(


                    controller: price,
                    validator: (p0) {
                      return null;
                    },
                    hinttext: "",
                    width: 281,
                    title: "Delivery charges",
                    titleon: true,
                    textinputtype: TextInputType.number,
                    isDollar: true,
                    readonly: false,
                  ),
                  iconButtonIWidget(
                      "icons/png/updateicon.png", AppColors.purple, (){}),
                  const SizedBox(
                    width: 5,
                  ),
                  iconButtonIWidget(
                      "icons/png/deleteicon.png", AppColors.orangesoft, (){}),
                ],
              ),
            ])));
  }
}

Widget iconButtonIWidget(String img, Color color, VoidCallback ontap) {
  return CustomIconButton(
    color: color.withValues(alpha:0.5),
    img: img,
    onPressed: ontap,
  );


}
