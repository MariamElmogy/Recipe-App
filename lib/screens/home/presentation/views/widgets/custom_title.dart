import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppFontStyles.styleBold20(context),
      textScaler: const TextScaler.linear(1.4),
    );
  }
}
