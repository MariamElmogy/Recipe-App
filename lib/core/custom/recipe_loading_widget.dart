import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';

class RecipeLoadingWidget extends StatelessWidget {
  const RecipeLoadingWidget({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.height * .1,
        ),
        const Icon(
          Icons.cookie_outlined,
          color: Color(0XFF97A2B0),
        ),
        Text(
        text  ,
          style: AppFontStyles.styleRegular14(context),
        ),
      ],
    );
  }
}
