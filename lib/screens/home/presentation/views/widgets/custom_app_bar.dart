import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isAmPm() ? Icons.wb_sunny_outlined : Icons.nightlight_outlined,
          color: const Color(0XFF4D8194),
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(
          isAmPm() ? 'Good Morning' : 'Good Evening',
          style: AppFontStyles.styleRegular18(context),
        ),
      ],
    );
  }

  bool isAmPm() {
    if (DateTime.now().hour > 12) return false;
    return true;
  }
}
