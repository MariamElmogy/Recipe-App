import 'package:flutter/material.dart';

class AppFontStyles {
  static TextStyle styleBold30(context) => TextStyle(
        color: const Color(0XFFFFFFFF),
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontWeight: FontWeight.bold,
      );
  static TextStyle styleBold16(context) => TextStyle(
        color: const Color(0XFFFFFFFF),
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.bold,
      );
  static TextStyle styleSemiBold26(context) => TextStyle(
        color: const Color(0XFF000000),
        fontSize: getResponsiveFontSize(context, fontSize: 26),
        fontWeight: FontWeight.w600,
      );
  static TextStyle styleRegular20(context) => TextStyle(
        color: Colors.black38,
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w400,
      );
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  return width / 1920;
}
