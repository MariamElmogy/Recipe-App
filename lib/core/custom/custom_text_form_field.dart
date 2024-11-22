import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.onChanged, this.controller});

  final Function(String)? onChanged;
  final TextEditingController? controller;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0XFFE6EBF2),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.backgroundColor,
            width: 2,
          ),
        ),
        contentPadding:
            EdgeInsets.symmetric(vertical: SizeConfig.height * .025),
        prefixIcon: const Icon(
          Icons.search_outlined,
          color: Color(0XFF0A2533),
        ),
        hintText: "Search",
        hintStyle: AppFontStyles.styleRegular16(context).copyWith(
          color: const Color(0XFF97A2B0),
        ),
      ),
    );
  }
}
