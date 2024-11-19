import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/images_data.dart';
import 'package:recipe_app/core/utils/size_config.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,
      height: SizeConfig.height * .25,
      padding: EdgeInsets.all(SizeConfig.height * .025),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.backgroundColor,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              ImagesData.chef,
              fit: BoxFit.scaleDown,
              height: SizeConfig.height * .2,
            ),
          ),
          Positioned(
            top: SizeConfig.height * .04,
            child: Text(
              "Cook the best\nrecipe at home",
              style: AppFontStyles.styleBold20(context).copyWith(
                color: const Color(0XFFFFFFFF),
              ),
              textScaler: const TextScaler.linear(1.5),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  size: SizeConfig.height * 0.02,
                  color: Colors.white,
                ),
                SizedBox(width: SizeConfig.width * .02),
                Text(
                  "In few minutes",
                  style: AppFontStyles.styleRegular16(context)
                      .copyWith(color: const Color(0XFFFFFFFF)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
