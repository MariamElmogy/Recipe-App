import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Center(
        child: Text(title, style: AppFontStyles.styleRegular16(context)),
      ),
    );
  }
}
