import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';

class RecipeInstructions extends StatelessWidget {
  const RecipeInstructions({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Instructions",
            style: AppFontStyles.styleBold20(context),
          ),
          SizedBox(height: SizeConfig.height * .01),
          Text(
            "${recipe.instructions!.length} Item",
            style: AppFontStyles.styleBold16(context).copyWith(
              color: const Color(0XFF748189),
            ),
          ),
          SizedBox(height: SizeConfig.height * .02),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recipe.instructions!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 8),
                child: Text(
                  "${index + 1}. ${recipe.instructions![index]}",
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
