import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';

class RecipeRateWidget extends StatelessWidget {
  const RecipeRateWidget({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 16,
        ),
        SizedBox(width: SizeConfig.width * .01),
        Text(
          "${recipe.rating}/5.0",
          style: AppFontStyles.styleRegular16(context).copyWith(
            color: const Color(0XFF97A2B0),
          ),
        ),
      ],
    );
  }
}
