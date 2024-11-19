import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width * .4,
      margin: EdgeInsets.only(
          right: SizeConfig.width * .04,
          top: SizeConfig.height * .005,
          bottom: SizeConfig.height * .005,
          left: SizeConfig.width * .02),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 10),
            color: const Color(0xFF063336).withOpacity(.10),
            blurRadius: 10,
          )
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.width,
                height: SizeConfig.height * .14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: recipe.image != null
                      ? DecorationImage(
                          image: NetworkImage(recipe.image!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              SizedBox(height: SizeConfig.height * .012),
              Text(
                recipe.name ?? "Unknown",
                style: AppFontStyles.styleBold16(context)
                    .copyWith(color: AppColors.titleColor),
              ),
              SizedBox(height: SizeConfig.height * .009),
            ],
          ),
          Positioned(
            bottom: 5,
            left: 5,
            right: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.fastfood_outlined,
                  color: Color(0XFF97A2B0),
                  size: 14,
                ),
                Text("${recipe.caloriesPerServing} Kcal",
                    style: AppFontStyles.styleRegular14(context)),
                Text(".", style: AppFontStyles.styleRegular14(context)),
                const Icon(
                  Icons.timer_outlined,
                  color: Color(0XFF97A2B0),
                  size: 14,
                ),
                Text("${recipe.cookTimeMinutes} Min",
                    style: AppFontStyles.styleRegular14(context)),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: SizeConfig.width * .07,
              height: SizeConfig.height * .04,
              decoration: BoxDecoration(
                color: const Color(0XFFFFFFFF).withOpacity(.8),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.favorite_outline,
                color: Colors.black,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
