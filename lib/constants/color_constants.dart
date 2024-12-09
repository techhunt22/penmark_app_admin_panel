import 'package:flutter/material.dart';


class AppColors {
  // Font Family
  static const Color  background = Color(0xffF3F4F6);
  static const Color  primarycolor = Color(0xff344675);

  static const Color brightblue = Color(0xff3B82F6);
  static const Color darkblue = Color(0xff101324);
  static const Color orangesoft = Color(0xffFB923C);
  static const Color warmgray = Color(0xff9CA3AF);
  static const Color lightgray = Color(0xffF3F4F6);
  static const Color gray = Color(0xffADADAD);

  static const Color  white = Colors.white;
  static const Color  white2 = Color(0xffF5F5F5);
  static const Color  black = Color(0xff000000);
  static const Color  purple = Color(0xffA78BFA);
  static const Color  yellowvibrant = Color(0xffFBBF24);




  static const Color  red = Colors.red;
  static const Color transparent = Colors.transparent;

  static Color greylight =  const Color(0xffFFFFFF).withOpacity(0.65);
  static const Color grey =  Colors.grey;

}





LinearGradient buttonlineargradient() {
  return const LinearGradient(
    colors: [
      Color(0xff4C2180),
      Color(0xff8A2BE2)
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}

