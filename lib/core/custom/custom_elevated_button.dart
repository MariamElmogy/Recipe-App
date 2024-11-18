import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: Size(
          SizeConfig.width * .5,
          SizeConfig.height * .01,
        ),
        backgroundColor: AppColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        "Get Started",
        style: AppFontStyles.styleBold16(context),
      ),
    );
  }
}
