import 'package:flutter/material.dart';
import 'package:recipe_app/core/custom/image_container.dart';
import 'package:recipe_app/core/custom/recipe_rate_widget.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/presentation/views/detail_recipe_view.dart';

class PopularCategoryItem extends StatelessWidget {
  const PopularCategoryItem({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailRecipeView(recipe: recipe),
        ),
      ),
      child: Container(
        height: SizeConfig.height * .15,
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * .02,
          vertical: SizeConfig.height * .01,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * .03,
          vertical: SizeConfig.height * .01,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0XFF063336).withOpacity(.2),
              offset: const Offset(0, 1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageContainer(
              width: SizeConfig.width * .25,
              image: recipe.image,
            ),
            SizedBox(width: SizeConfig.width * .03),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: SizeConfig.height * .02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name ?? "",
                      style: AppFontStyles.styleBold20(context).copyWith(
                        color: AppColors.titleColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: SizeConfig.height * .01),
                    RecipeRateWidget(recipe: recipe),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: SizeConfig.height * .02),
                child: Hero(
                  tag: 'arrowIcon-${recipe.id}',
                  child: Container(
                    height: SizeConfig.height * .03,
                    width: SizeConfig.height * .03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.titleColor,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: SizeConfig.width * .025),
          ],
        ),
      ),
    );
  }
}
