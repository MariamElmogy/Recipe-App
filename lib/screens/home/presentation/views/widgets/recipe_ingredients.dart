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
      height: SizeConfig.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ingredients",
            style: AppFontStyles.styleBold20(context),
          ),
          SizedBox(height: SizeConfig.height * .01),
          Text(
            "${recipe.ingredients!.length} Item",
            style: AppFontStyles.styleRegular16(context).copyWith(
              color: const Color(0XFF748189),
            ),
          ),
          SizedBox(height: SizeConfig.height * .02),
          ListView.builder(
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
        ],
      ),
    );
  }
}
