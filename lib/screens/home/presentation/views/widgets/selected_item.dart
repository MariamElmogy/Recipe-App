

import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';

class SelectedItem extends StatelessWidget {
  const SelectedItem({
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
        color: const Color(0XFF042628),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: AppFontStyles.styleMedium16(context).copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
