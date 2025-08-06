import 'package:coloring_app_admin_panel/src/presentation/controllers/settings/charges/get_charges_controller.dart';
import 'package:coloring_app_admin_panel/utils/CustomWidgets/custom_textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/padding.dart';
import '../../../../constants/size_constant.dart';
import '../../../../utils/CustomWidgets/custom_buttons.dart';
import '../../../core/bindings/settings/settings_bindings.dart';

import '../../controllers/settings/papersize/addpapersize/add_papersize_controller.dart';
import '../../controllers/settings/papersize/deletepapersize/delete_papersize_controller.dart';
import '../../controllers/settings/papersize/getpapersize/get_papersize_controller.dart';
import '../../controllers/settings/papersize/updatepapersize/update_papersize_controller.dart';
import '../../controllers/settings/papertype/addpapertype/add_papertype_controller.dart';
import '../../controllers/settings/papertype/deletepapertype/delete_papertype_controller.dart';
import '../../controllers/settings/papertype/getpapertype/get_papertype_controller.dart';
import '../../controllers/settings/papertype/updatepapertype/update_papertype_controller.dart';
import '../../widgets/profile_notification_widget.dart';
import '../../widgets/user_profile_img.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController fullname = TextEditingController();
  final TextEditingController number = TextEditingController();
  final TextEditingController email = TextEditingController();


  late final PaperSizeController paperSize;
  late final AddPaperSizeController addPaperSize;
  late final DeletePaperSizeController deletePaperSize;
  late final UpdatePaperSizeController updatePaperSize;

  late final PaperTypeController paperType;
  late final AddPaperTypeController addPaperType;
  late final UpdatePaperTypeController updatePaperType;
  late final DeletePaperTypeController deletePaperType;

  late final GetChargesController getCharges;

  @override
  void initState() {
    super.initState();
    SettingsDependencies.inject();

    paperSize = Get.find();
    addPaperSize = Get.find();
    deletePaperSize = Get.find();
    updatePaperSize = Get.find();
    paperType = Get.find();
    addPaperType = Get.find();
    updatePaperType = Get.find();
    deletePaperType = Get.find();
    getCharges = Get.find();
  }

  @override
  void dispose() {
    fullname.dispose();
    number.dispose();
    email.dispose();

    super.dispose();
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
              Text(
                "Settings",
                style: TextStyle(
                    fontSize: AppFontSize.displaysmall,
                    fontWeight: AppFonts.medium),
              ),
              SizedBox(width: 1160,),
              ProfileNotificationWidget(),
            ],
          ),

          //const SizedBox(height: gap3),


          const SizedBox(
            height: gap1,
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
              controller: fullname,
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
              controller: number,
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
              controller: email,
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
                    controller: addPaperSize.addPrintSize,
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
                    controller: addPaperSize.addPrintPrice,
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


                  Obx(() {
                    if (addPaperSize.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          color: AppColors.yellowvibrant,),
                      );
                    }


                    return CustomIconButton(
                      color: AppColors.yellowvibrant,
                      img: "icons/png/addicon.png",
                      onPressed: () async {
                        await addPaperSize.addPaperSizes(
                            size: addPaperSize.addPrintSize.text.trim(),
                            price: addPaperSize.addPrintPrice.text.trim());
                      },
                    );
                  }),

                  //for extra space
                  ElevatedButton(
                    style: ButtonStyle(
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(
                                vertical: 20, horizontal: 0)),
                        backgroundColor:
                        WidgetStatePropertyAll(AppColors.white),
                        splashFactory: NoSplash.splashFactory,
                        shadowColor: WidgetStatePropertyAll(
                            Colors.transparent),
                        overlayColor:
                        WidgetStatePropertyAll(AppColors.transparent),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                    onPressed: () async {

                    },
                    child: null,
                  ),
                ],
              ),

              SizedBox(
                height: gap2,
              ),

              Expanded(
                child: Obx(() {
                  final sizes = paperSize.paperSize;

                  if (paperSize.errorMessage.isNotEmpty) {
                    return Text(paperSize.errorMessage.value);
                  }

                  if (paperSize.isLoading.value) {
                    return Skeletonizer(
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  PrintTextField(
                                    controller: TextEditingController(),
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
                                    controller: TextEditingController(),
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
                                      "icons/png/updateicon.png",
                                      AppColors.purple, () {}),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  iconButtonIWidget(
                                      "icons/png/deleteicon.png",
                                      AppColors.orangesoft, () {})
                                ],
                              ),
                            );
                          },
                        )
                    );
                  }


                  return ListView.builder(
                    itemCount: sizes.length,
                    cacheExtent: 400,
                    itemBuilder: (context, index) {
                      final formController = paperSize.formControllers[index];
                      final paper = paperSize.paperSize[index];

                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            PrintTextField(
                              controller: formController.sizeController,
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
                              controller: formController.priceController,
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


                            Obx(() {
                              final isLoadingUpdate = updatePaperSize
                                  .isLoadingMap[paper.id]?.value ?? false;
                              final isLoadingDelete = deletePaperSize
                                  .isLoadingMap[paper.id]?.value ?? false;

                              // If either update or delete is loading, show the spinner and hide the buttons
                              if (isLoadingUpdate || isLoadingDelete) {
                                return Row(
                                  children: [
                                    Center(
                                      child: CircularProgressIndicator(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15, top: 20),
                                        color: AppColors.yellowvibrant,
                                      ),
                                    ),

                                    SizedBox(
                                      width: 50,
                                    ),
                                  ],
                                );
                              }

                              // If not loading, show the update and delete buttons
                              return Row(
                                children: [
                                  iconButtonIWidget(
                                    "icons/png/updateicon.png",
                                    AppColors.purple,
                                        () async {
                                      await updatePaperSize.updatePaperSizes(
                                        id: paper.id,
                                        size: formController.sizeController
                                            .text,
                                        price: formController.priceController
                                            .text,
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  iconButtonIWidget(
                                    "icons/png/deleteicon.png",
                                    AppColors.orangesoft,
                                        () async {
                                      await deletePaperSize.deletePaperSizes(
                                          id: paper.id);
                                    },
                                  ),
                                ],
                              );
                            }),

                          ],
                        ),
                      );
                    },
                  );
                }),
              )

            ]
            )
        )
    );
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
                    controller: addPaperType.addPrintType,
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
                    controller: addPaperType.addPrintPrice,
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
                  Obx(() {
                    if (addPaperType.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          color: AppColors.yellowvibrant,),
                      );
                    }


                    return CustomIconButton(
                      color: AppColors.yellowvibrant,
                      img: "icons/png/addicon.png",
                      onPressed: () async {
                        await addPaperType.addPaperType(
                            type: addPaperType.addPrintType.text.trim(),
                            price: addPaperType.addPrintPrice.text.trim());
                      },
                    );
                  }),

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
                child: Obx(() {
                  final types = paperType.paperType;

                  if (paperType.errorMessage.isNotEmpty) {
                    return Text(paperType.errorMessage.value);
                  }

                  if (paperType.isLoading.value) {
                    return Skeletonizer(
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  PrintTextField(
                                    controller: TextEditingController(),
                                    validator: (p0) {
                                      return null;
                                    },
                                    hinttext: "Type",
                                    width: 156,
                                    title: "Types",
                                    titleon: index == 0 ? true : false,
                                    isDollar: false,
                                    readonly: false,
                                    textinputtype: TextInputType.number,
                                  ),
                                  PrintTextField(
                                    controller: TextEditingController(),
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
                                      "icons/png/updateicon.png",
                                      AppColors.purple, () {}),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  iconButtonIWidget(
                                      "icons/png/deleteicon.png",
                                      AppColors.orangesoft, () {})
                                ],
                              ),
                            );
                          },
                        )
                    );
                  }


                  return ListView.builder(
                    itemCount: types.length,
                    cacheExtent: 400,

                    itemBuilder: (context, index) {
                      final typeController = paperType.formControllers[index];
                      final types = paperType.paperType[index];

                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            PrintTextField(
                              controller: typeController.typeController,
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
                              controller: typeController.priceController,
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

                            Obx(() {
                              final isLoadingPaperTypeUpdate = updatePaperType
                                  .isLoadingMap[types.id]?.value ?? false;
                              final isLoadingPaperTypeDelete = deletePaperType
                                  .isLoadingMap[types.id]?.value ?? false;

                              // If either update or delete is loading, show the spinner and hide the buttons
                              if (isLoadingPaperTypeUpdate ||
                                  isLoadingPaperTypeDelete) {
                                return Row(
                                  children: [
                                    Center(
                                      child: CircularProgressIndicator(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15, top: 20),
                                        color: AppColors.yellowvibrant,
                                      ),
                                    ),

                                    SizedBox(
                                      width: 50,
                                    ),
                                  ],
                                );
                              }

                              return Row(
                                children: [
                                  iconButtonIWidget(
                                      "icons/png/updateicon.png",
                                      AppColors.purple,
                                          () async {
                                        await updatePaperType.updatePaperTypes(
                                          id: types.id,
                                          type: typeController.typeController
                                              .text.trim(),
                                          price: typeController.priceController
                                              .text.trim(),
                                        );
                                      }
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  iconButtonIWidget(
                                      "icons/png/deleteicon.png",
                                      AppColors.orangesoft,
                                          () async {
                                        await deletePaperType.deletePaperTypes(
                                            id: types.id);
                                      }
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      );
                    },
                  );
                }),
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
              Obx(() {
                if (getCharges.errorMessage.isNotEmpty) {
                  return Text(getCharges.errorMessage.value);
                }

                if (getCharges.isLoading.value) {
                  return Skeletonizer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PrintTextField(
                            controller: TextEditingController(),
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
                                "icons/png/updateicon.png", AppColors.purple, () {}),

                          const SizedBox(
                            width: 5,
                          ),
                          //  iconButtonIWidget("icons/png/deleteicon.png", AppColors.orangesoft, () {}),


                          SizedBox(width: gap5,),


                          PrintTextField(


                            controller:  TextEditingController(),
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
                                "icons/png/updateicon.png", AppColors.purple, () {}),


                          const SizedBox(
                            width: 5,
                          ),
                          //  iconButtonIWidget("icons/png/deleteicon.png", AppColors.orangesoft, () {}),
                        ],
                      )
                  );
                }


                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PrintTextField(
                      controller: getCharges.formControllers[0].taxController,
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
                          "icons/png/updateicon.png", AppColors.purple, () {}),

                    const SizedBox(
                      width: 5,
                    ),
                    //  iconButtonIWidget("icons/png/deleteicon.png", AppColors.orangesoft, () {}),


                    SizedBox(width: gap5,),


                    PrintTextField(


                      controller: getCharges.formControllers[0]
                          .deliveryController,
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
                          "icons/png/updateicon.png", AppColors.purple, () {}),


                    const SizedBox(
                      width: 5,
                    ),
                    //  iconButtonIWidget("icons/png/deleteicon.png", AppColors.orangesoft, () {}),
                  ],
                );
              }),
            ])));
  }
}

Widget iconButtonIWidget(String img, Color color, VoidCallback ontap) {
  return CustomIconButton(
    color: color.withValues(alpha: 0.5),
    img: img,
    onPressed: ontap,
  );
}
