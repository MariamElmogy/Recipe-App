import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height / 1.2,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: recipe.ingredients!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 8),
            child: Text(
              "${index + 1}. ${recipe.ingredients![index]}",
              style: AppFontStyles.styleRegular20(context)
                  .copyWith(color: AppColors.titleColor),
            ),
          );
        },
      ),
    );
  }
}
