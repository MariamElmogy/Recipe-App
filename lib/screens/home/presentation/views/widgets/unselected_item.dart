import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';

class UnselectedItem extends StatelessWidget {
  const UnselectedItem({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: SizeConfig.height * .06,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: AppFontStyles.styleMedium16(context).copyWith(
          color: AppColors.titleColor,
        ),
      ),
    );
  }
}
