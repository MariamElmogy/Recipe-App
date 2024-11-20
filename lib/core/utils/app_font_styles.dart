import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';

class AppFontStyles {
  static TextStyle styleBold30(context) => TextStyle(
        color: const Color(0XFFFFFFFF),
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontWeight: FontWeight.bold,
      );

  static TextStyle styleBold20(context) => TextStyle(
        color: AppColors.titleColor,
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.bold,
      );
  static TextStyle styleBold16(context) => TextStyle(
        color: const Color(0XFFFFFFFF),
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.bold,
      );
  static TextStyle styleBold18(context) => TextStyle(
        color: const Color(0XFFFFFFFF),
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.bold,
      );
  static TextStyle styleBold24(context) => TextStyle(
        color: const Color(0XFF0A2533),
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeight.bold,
      );
  static TextStyle styleMedium16(context) => TextStyle(
        color: const Color(0XFF0A2533),
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w500,
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
  static TextStyle styleRegular16(context) => TextStyle(
        // color: const Color(0XFFFFFFFF),
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w400,
      );

  static TextStyle styleRegular14(context) => TextStyle(
        color: const Color(0XFF97A2B0),
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w400,
      );
  static TextStyle styleRegular18(context) => TextStyle(
        color: const Color(0XFF0A2533),
        fontSize: getResponsiveFontSize(context, fontSize: 18),
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
