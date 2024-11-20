import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/recipe_calorie_and_service.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/recipe_detail_tab_bar.dart';

class RecipeDetailItem extends StatefulWidget {
  const RecipeDetailItem({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<RecipeDetailItem> createState() => _RecipeDetailItemState();
}

class _RecipeDetailItemState extends State<RecipeDetailItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: SizeConfig.height * .005,
              width: SizeConfig.width * .12,
              decoration: BoxDecoration(
                color: const Color(0XFFE3EBEC),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 25),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.recipe.name!,
              style: AppFontStyles.styleBold24(context),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.timer_outlined,
                color: Color(0XFF97A2B0),
                size: 16,
              ),
              SizedBox(width: SizeConfig.width * .01),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "${widget.recipe.prepTimeMinutes} Min",
                  style: AppFontStyles.styleRegular16(context).copyWith(
                    color: const Color(0XFF97A2B0),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.width * .02),
              Text(
                ".",
                style: AppFontStyles.styleRegular16(context),
              ),
              SizedBox(width: SizeConfig.width * .02),
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 16,
              ),
              SizedBox(width: SizeConfig.width * .01),
              Text(
                "${widget.recipe.rating}/5",
                style: AppFontStyles.styleRegular16(context),
              ),
              const Spacer(),
              Text(
                "${widget.recipe.difficulty} difficulty",
                style: AppFontStyles.styleRegular16(context),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.height * .04),
          RecipeCalorieAndService(recipe: widget.recipe),
          SizedBox(height: SizeConfig.height * .04),
          RecipeDetailTabBar(recipe: widget.recipe),
        ],
      ),
    );
  }
}
