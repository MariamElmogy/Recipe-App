import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/images_data.dart';

class CalorieIcon extends StatelessWidget {
  const CalorieIcon({super.key, this.colorIcon});
  final Color? colorIcon;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      ImagesData.level,
      fit: BoxFit.cover,
      height: 25,
      width: 25,
      colorFilter: ColorFilter.mode(
        colorIcon ?? AppColors.titleColor,
        BlendMode.modulate,
      ),
    );
  }
}
