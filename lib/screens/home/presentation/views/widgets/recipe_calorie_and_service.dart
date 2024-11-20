import 'package:flutter/material.dart';
import 'package:recipe_app/core/custom/calorie_icon.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';

class RecipeCalorieAndService extends StatelessWidget {
  const RecipeCalorieAndService({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0XFFE6EBF2),
          ),
          child: const CalorieIcon(),
        ),
        SizedBox(width: SizeConfig.width * .02),
        Text(
          "${recipe.caloriesPerServing} Calories",
          style: AppFontStyles.styleMedium16(context),
        ),
        SizedBox(width: SizeConfig.width / 6),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0XFFE6EBF2),
          ),
          child: const Icon(
            Icons.person,
            color: AppColors.titleColor,
          ),
        ),
        SizedBox(width: SizeConfig.width * .02),
        Text(
          "${recipe.servings} Persons",
          style: AppFontStyles.styleMedium16(context),
        ),
      ],
    );
  }
}
